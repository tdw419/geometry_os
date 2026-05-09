; DESCRIPTION: Draws a cyan line from (433, 177) to (165, 232).
; PLAN: r0=433(x1), r1=177(y1), r2=165(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 177
LDI r2, 165
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
