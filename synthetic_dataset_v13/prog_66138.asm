; DESCRIPTION: Draws a cyan line from (31, 232) to (455, 86).
; PLAN: r0=31(x1), r1=232(y1), r2=455(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 232
LDI r2, 455
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
