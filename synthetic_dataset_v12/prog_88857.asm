; DESCRIPTION: Places a cyan line segment connecting (305, 167) to (497, 219).
; PLAN: r0=305(x1), r1=167(y1), r2=497(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 167
LDI r2, 497
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
