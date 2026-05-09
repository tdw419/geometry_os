; DESCRIPTION: Places a cyan line segment connecting (258, 105) to (182, 128).
; PLAN: r0=258(x1), r1=105(y1), r2=182(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 105
LDI r2, 182
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
