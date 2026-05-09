; DESCRIPTION: Places a cyan line segment connecting (16, 16) to (194, 134).
; PLAN: r0=16(x1), r1=16(y1), r2=194(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 16
LDI r2, 194
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
