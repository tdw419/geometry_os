; DESCRIPTION: Places a white line segment connecting (205, 76) to (305, 243).
; PLAN: r0=205(x1), r1=76(y1), r2=305(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 76
LDI r2, 305
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
