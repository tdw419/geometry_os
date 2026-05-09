; DESCRIPTION: Places a cyan line segment connecting (440, 219) to (348, 178).
; PLAN: r0=440(x1), r1=219(y1), r2=348(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 219
LDI r2, 348
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
