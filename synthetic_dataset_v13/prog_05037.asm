; DESCRIPTION: Composite: Draws a black line from (18, 201) to (237, 103) then Renders a cyan disk with center (363, 127) and radius 32 then Creates a orange rectangular region at (33, 11) spanning 35 by 72 pixels.
; PLAN: r0=18(x1), r1=201(y1), r2=237(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=127(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=33(x), r11=11(y), r12=35(width), r13=72(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 201
LDI r2, 237
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 127
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 33
LDI r11, 11
LDI r12, 35
LDI r13, 72
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
