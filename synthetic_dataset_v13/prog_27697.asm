; DESCRIPTION: Composite: Draws a purple circle centered at (401, 171) with radius 22 then Draws a purple line from (170, 107) to (283, 11).
; PLAN: r0=401(x), r1=171(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x1), r6=107(y1), r7=283(x2), r8=11(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 171
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 107
LDI r7, 283
LDI r8, 11
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
