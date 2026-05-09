; DESCRIPTION: Places a red line segment connecting (308, 239) to (243, 99).
; PLAN: r0=308(x1), r1=239(y1), r2=243(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 239
LDI r2, 243
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
