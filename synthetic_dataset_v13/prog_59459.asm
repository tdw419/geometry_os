; DESCRIPTION: Draws a cyan line from (505, 89) to (8, 64).
; PLAN: r0=505(x1), r1=89(y1), r2=8(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 89
LDI r2, 8
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
