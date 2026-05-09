; DESCRIPTION: Draws a cyan line from (107, 117) to (114, 197).
; PLAN: r0=107(x1), r1=117(y1), r2=114(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 117
LDI r2, 114
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
