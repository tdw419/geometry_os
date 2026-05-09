; DESCRIPTION: Draws a cyan line from (296, 150) to (51, 164).
; PLAN: r0=296(x1), r1=150(y1), r2=51(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 150
LDI r2, 51
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
