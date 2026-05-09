; DESCRIPTION: Places a red line segment connecting (320, 38) to (150, 227).
; PLAN: r0=320(x1), r1=38(y1), r2=150(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 38
LDI r2, 150
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
