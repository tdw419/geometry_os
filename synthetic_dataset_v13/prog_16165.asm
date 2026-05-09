; DESCRIPTION: Composite: Places a magenta line segment connecting (281, 40) to (296, 70) then Sets a single white pixel at (135, 163).
; PLAN: r0=281(x1), r1=40(y1), r2=296(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=163(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 40
LDI r2, 296
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 163
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
