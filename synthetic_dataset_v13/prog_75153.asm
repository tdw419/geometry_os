; DESCRIPTION: Places a cyan line segment connecting (302, 167) to (27, 188).
; PLAN: r0=302(x1), r1=167(y1), r2=27(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 167
LDI r2, 27
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
