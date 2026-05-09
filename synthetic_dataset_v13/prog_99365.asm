; DESCRIPTION: Places a black line segment connecting (398, 11) to (403, 246).
; PLAN: r0=398(x1), r1=11(y1), r2=403(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 11
LDI r2, 403
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
