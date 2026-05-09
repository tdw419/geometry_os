; DESCRIPTION: Draws a cyan line from (159, 108) to (287, 30).
; PLAN: r0=159(x1), r1=108(y1), r2=287(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 108
LDI r2, 287
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
