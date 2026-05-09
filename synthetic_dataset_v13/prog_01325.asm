; DESCRIPTION: Draws a cyan line from (49, 146) to (423, 183).
; PLAN: r0=49(x1), r1=146(y1), r2=423(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 146
LDI r2, 423
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
