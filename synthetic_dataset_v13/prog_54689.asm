; DESCRIPTION: Draws a cyan line from (159, 97) to (436, 234).
; PLAN: r0=159(x1), r1=97(y1), r2=436(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 97
LDI r2, 436
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
