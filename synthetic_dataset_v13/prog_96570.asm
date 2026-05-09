; DESCRIPTION: Places a cyan line segment connecting (206, 21) to (491, 218).
; PLAN: r0=206(x1), r1=21(y1), r2=491(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 21
LDI r2, 491
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
