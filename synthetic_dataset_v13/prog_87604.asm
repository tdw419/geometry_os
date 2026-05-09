; DESCRIPTION: Places a cyan line segment connecting (361, 51) to (260, 134).
; PLAN: r0=361(x1), r1=51(y1), r2=260(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 51
LDI r2, 260
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
