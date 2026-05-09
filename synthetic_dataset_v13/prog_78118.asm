; DESCRIPTION: Places a cyan line segment connecting (131, 51) to (361, 135).
; PLAN: r0=131(x1), r1=51(y1), r2=361(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 51
LDI r2, 361
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
