; DESCRIPTION: Places a cyan line segment connecting (287, 167) to (469, 152).
; PLAN: r0=287(x1), r1=167(y1), r2=469(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 167
LDI r2, 469
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
