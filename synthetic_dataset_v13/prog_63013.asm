; DESCRIPTION: Draws a cyan line from (362, 244) to (119, 211).
; PLAN: r0=362(x1), r1=244(y1), r2=119(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 244
LDI r2, 119
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
