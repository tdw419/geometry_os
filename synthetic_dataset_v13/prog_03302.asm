; DESCRIPTION: Places a orange line segment connecting (235, 130) to (66, 103).
; PLAN: r0=235(x1), r1=130(y1), r2=66(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 130
LDI r2, 66
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
