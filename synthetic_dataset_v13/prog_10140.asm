; DESCRIPTION: Places a cyan line segment connecting (319, 221) to (4, 252).
; PLAN: r0=319(x1), r1=221(y1), r2=4(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 221
LDI r2, 4
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
