; DESCRIPTION: Places a cyan line segment connecting (268, 18) to (432, 95).
; PLAN: r0=268(x1), r1=18(y1), r2=432(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 18
LDI r2, 432
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
