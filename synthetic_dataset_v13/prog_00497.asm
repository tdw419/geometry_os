; DESCRIPTION: Places a red line segment connecting (208, 12) to (215, 219).
; PLAN: r0=208(x1), r1=12(y1), r2=215(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 12
LDI r2, 215
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
