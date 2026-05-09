; DESCRIPTION: Draws a blue line from (146, 182) to (174, 246).
; PLAN: r0=146(x1), r1=182(y1), r2=174(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 182
LDI r2, 174
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
