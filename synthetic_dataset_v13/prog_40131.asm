; DESCRIPTION: Places a cyan line segment connecting (41, 236) to (469, 207).
; PLAN: r0=41(x1), r1=236(y1), r2=469(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 236
LDI r2, 469
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
