; DESCRIPTION: Draws a cyan line from (132, 142) to (469, 197).
; PLAN: r0=132(x1), r1=142(y1), r2=469(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 142
LDI r2, 469
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
