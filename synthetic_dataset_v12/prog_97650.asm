; DESCRIPTION: Places a orange line segment connecting (235, 210) to (290, 150).
; PLAN: r0=235(x1), r1=210(y1), r2=290(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 210
LDI r2, 290
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
