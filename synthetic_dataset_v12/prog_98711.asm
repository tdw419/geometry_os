; DESCRIPTION: Places a cyan line segment connecting (305, 187) to (469, 206).
; PLAN: r0=305(x1), r1=187(y1), r2=469(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 187
LDI r2, 469
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
