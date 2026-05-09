; DESCRIPTION: Draws a cyan line from (53, 188) to (489, 86).
; PLAN: r0=53(x1), r1=188(y1), r2=489(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 188
LDI r2, 489
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
