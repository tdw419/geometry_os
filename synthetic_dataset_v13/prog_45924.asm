; DESCRIPTION: Composite: Renders a yellow box of size 96x94 starting at (326, 54) then Places a green dot at position (103, 186) then Places a red circle of radius 77 at center (346, 109).
; PLAN: r0=326(x), r1=54(y), r2=96(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=186(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=346(x), r11=109(y), r12=77(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 326
LDI r1, 54
LDI r2, 96
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 186
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 346
LDI r11, 109
LDI r12, 77
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
