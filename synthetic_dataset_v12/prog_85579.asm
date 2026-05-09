; DESCRIPTION: Draws a cyan line from (389, 9) to (164, 177).
; PLAN: r0=389(x1), r1=9(y1), r2=164(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 9
LDI r2, 164
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
