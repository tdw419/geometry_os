; DESCRIPTION: Draws a cyan line from (361, 141) to (51, 166).
; PLAN: r0=361(x1), r1=141(y1), r2=51(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 141
LDI r2, 51
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
