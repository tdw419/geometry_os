; DESCRIPTION: Composite: Sets a single yellow pixel at (187, 162) then Draws a red circle centered at (122, 140) with radius 42 then Draws a purple line from (492, 223) to (298, 128).
; PLAN: r0=187(x), r1=162(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=140(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=492(x1), r11=223(y1), r12=298(x2), r13=128(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 162
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 122
LDI r6, 140
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 492
LDI r11, 223
LDI r12, 298
LDI r13, 128
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
