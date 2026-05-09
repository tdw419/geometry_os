; DESCRIPTION: Places a cyan line segment connecting (84, 19) to (143, 237).
; PLAN: r0=84(x1), r1=19(y1), r2=143(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 19
LDI r2, 143
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
