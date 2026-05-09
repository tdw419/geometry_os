; DESCRIPTION: Places a cyan line segment connecting (432, 225) to (116, 127).
; PLAN: r0=432(x1), r1=225(y1), r2=116(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 225
LDI r2, 116
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
