; DESCRIPTION: Composite: Renders a blue disk with center (168, 123) and radius 42 then Sets a single cyan pixel at (218, 19) then Creates a black rectangular region at (176, 118) spanning 25 by 68 pixels.
; PLAN: r0=168(x), r1=123(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=19(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=118(y), r12=25(width), r13=68(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 123
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 19
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 176
LDI r11, 118
LDI r12, 25
LDI r13, 68
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
