; DESCRIPTION: Places a cyan line segment connecting (221, 167) to (292, 199).
; PLAN: r0=221(x1), r1=167(y1), r2=292(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 167
LDI r2, 292
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
