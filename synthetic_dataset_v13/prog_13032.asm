; DESCRIPTION: Places a cyan line segment connecting (110, 48) to (384, 81).
; PLAN: r0=110(x1), r1=48(y1), r2=384(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 48
LDI r2, 384
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
