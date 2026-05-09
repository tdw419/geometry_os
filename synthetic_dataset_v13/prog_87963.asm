; DESCRIPTION: Composite: Places a orange circle of radius 50 at center (302, 187) then Places a red line segment connecting (329, 42) to (237, 112).
; PLAN: r0=302(x), r1=187(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=42(y1), r7=237(x2), r8=112(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 187
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 42
LDI r7, 237
LDI r8, 112
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
