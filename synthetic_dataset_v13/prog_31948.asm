; DESCRIPTION: Draws a cyan line from (186, 189) to (107, 194).
; PLAN: r0=186(x1), r1=189(y1), r2=107(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 189
LDI r2, 107
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
