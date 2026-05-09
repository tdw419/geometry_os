; DESCRIPTION: Places a magenta line segment connecting (199, 175) to (298, 103).
; PLAN: r0=199(x1), r1=175(y1), r2=298(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 175
LDI r2, 298
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
