; DESCRIPTION: Places a black line segment connecting (64, 206) to (171, 139).
; PLAN: r0=64(x1), r1=206(y1), r2=171(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 206
LDI r2, 171
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
