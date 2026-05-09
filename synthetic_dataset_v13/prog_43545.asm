; DESCRIPTION: Composite: Renders a purple box of size 99x109 starting at (271, 51) then Renders a orange line between points (309, 83) and (332, 143).
; PLAN: r0=271(x), r1=51(y), r2=99(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x1), r6=83(y1), r7=332(x2), r8=143(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 51
LDI r2, 99
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 83
LDI r7, 332
LDI r8, 143
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
