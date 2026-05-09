; DESCRIPTION: Places a cyan line segment connecting (24, 242) to (199, 189).
; PLAN: r0=24(x1), r1=242(y1), r2=199(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 242
LDI r2, 199
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
