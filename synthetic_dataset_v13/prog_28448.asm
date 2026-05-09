; DESCRIPTION: Places a orange line segment connecting (507, 235) to (224, 243).
; PLAN: r0=507(x1), r1=235(y1), r2=224(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 235
LDI r2, 224
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
