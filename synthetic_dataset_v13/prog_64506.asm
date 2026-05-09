; DESCRIPTION: Composite: Places a green dot at position (1, 61) then Places a cyan circle of radius 29 at center (288, 117) then Draws a purple line from (332, 65) to (214, 9).
; PLAN: r0=1(x), r1=61(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=117(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x1), r11=65(y1), r12=214(x2), r13=9(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 61
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 288
LDI r6, 117
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 65
LDI r12, 214
LDI r13, 9
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
