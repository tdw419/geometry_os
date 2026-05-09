; DESCRIPTION: Renders a green line between points (31, 64) and (167, 39).
; PLAN: r0=31(x1), r1=64(y1), r2=167(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 64
LDI r2, 167
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
