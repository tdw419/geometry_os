; DESCRIPTION: Places a cyan line segment connecting (345, 145) to (346, 41).
; PLAN: r0=345(x1), r1=145(y1), r2=346(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 145
LDI r2, 346
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
