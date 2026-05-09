; DESCRIPTION: Draws a cyan line from (451, 166) to (297, 52).
; PLAN: r0=451(x1), r1=166(y1), r2=297(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 166
LDI r2, 297
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
