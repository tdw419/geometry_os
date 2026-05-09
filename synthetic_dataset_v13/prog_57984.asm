; DESCRIPTION: Draws a cyan line from (265, 197) to (133, 232).
; PLAN: r0=265(x1), r1=197(y1), r2=133(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 197
LDI r2, 133
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
