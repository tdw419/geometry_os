; DESCRIPTION: Composite: Creates a blue rectangular region at (75, 52) spanning 20 by 93 pixels then Sets a single cyan pixel at (117, 127) then Places a blue circle of radius 59 at center (176, 103).
; PLAN: r0=75(x), r1=52(y), r2=20(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=127(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=103(y), r12=59(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 75
LDI r1, 52
LDI r2, 20
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 127
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 176
LDI r11, 103
LDI r12, 59
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
