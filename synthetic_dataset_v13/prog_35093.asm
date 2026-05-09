; DESCRIPTION: Draws a cyan line from (451, 86) to (372, 148).
; PLAN: r0=451(x1), r1=86(y1), r2=372(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 86
LDI r2, 372
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
