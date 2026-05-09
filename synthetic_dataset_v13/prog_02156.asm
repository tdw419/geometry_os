; DESCRIPTION: Composite: Renders a magenta box of size 77x91 starting at (100, 133) then Draws a white line from (312, 180) to (251, 192).
; PLAN: r0=100(x), r1=133(y), r2=77(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=180(y1), r7=251(x2), r8=192(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 133
LDI r2, 77
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 180
LDI r7, 251
LDI r8, 192
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
