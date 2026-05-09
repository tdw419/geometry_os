; DESCRIPTION: Draws a cyan line from (146, 159) to (411, 6).
; PLAN: r0=146(x1), r1=159(y1), r2=411(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 159
LDI r2, 411
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
