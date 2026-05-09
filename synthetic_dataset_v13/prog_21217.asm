; DESCRIPTION: Places a cyan line segment connecting (220, 219) to (143, 189).
; PLAN: r0=220(x1), r1=219(y1), r2=143(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 219
LDI r2, 143
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
