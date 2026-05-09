; DESCRIPTION: Places a cyan line segment connecting (72, 12) to (24, 73).
; PLAN: r0=72(x1), r1=12(y1), r2=24(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 12
LDI r2, 24
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
