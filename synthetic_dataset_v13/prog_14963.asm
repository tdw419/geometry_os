; DESCRIPTION: Places a red line segment connecting (33, 220) to (487, 184).
; PLAN: r0=33(x1), r1=220(y1), r2=487(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 220
LDI r2, 487
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
