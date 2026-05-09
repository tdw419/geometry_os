; DESCRIPTION: Places a red line segment connecting (485, 124) to (63, 235).
; PLAN: r0=485(x1), r1=124(y1), r2=63(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 124
LDI r2, 63
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
