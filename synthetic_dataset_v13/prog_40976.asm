; DESCRIPTION: Draws a black line from (322, 228) to (287, 176).
; PLAN: r0=322(x1), r1=228(y1), r2=287(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 228
LDI r2, 287
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
