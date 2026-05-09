; DESCRIPTION: Places a cyan line segment connecting (230, 236) to (511, 75).
; PLAN: r0=230(x1), r1=236(y1), r2=511(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 236
LDI r2, 511
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
