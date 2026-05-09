; DESCRIPTION: Places a red line segment connecting (122, 148) to (243, 254).
; PLAN: r0=122(x1), r1=148(y1), r2=243(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 148
LDI r2, 243
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
