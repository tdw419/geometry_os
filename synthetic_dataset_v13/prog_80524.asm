; DESCRIPTION: Draws a cyan line from (248, 97) to (282, 39).
; PLAN: r0=248(x1), r1=97(y1), r2=282(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 97
LDI r2, 282
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
