; DESCRIPTION: Composite: Sets a single cyan pixel at (384, 63) then Renders a red disk with center (88, 91) and radius 55 then Draws a orange line from (180, 224) to (21, 162).
; PLAN: r0=384(x), r1=63(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=91(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=180(x1), r11=224(y1), r12=21(x2), r13=162(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 63
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 91
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 180
LDI r11, 224
LDI r12, 21
LDI r13, 162
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
