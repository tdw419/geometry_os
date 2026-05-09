; DESCRIPTION: Places a cyan line segment connecting (57, 184) to (457, 242).
; PLAN: r0=57(x1), r1=184(y1), r2=457(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 184
LDI r2, 457
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
