; DESCRIPTION: Places a red line segment connecting (446, 161) to (505, 68).
; PLAN: r0=446(x1), r1=161(y1), r2=505(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 161
LDI r2, 505
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
