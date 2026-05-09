; DESCRIPTION: Places a cyan line segment connecting (237, 226) to (119, 64).
; PLAN: r0=237(x1), r1=226(y1), r2=119(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 226
LDI r2, 119
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
