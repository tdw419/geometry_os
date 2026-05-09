; DESCRIPTION: Draws a cyan line from (455, 232) to (486, 16).
; PLAN: r0=455(x1), r1=232(y1), r2=486(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 232
LDI r2, 486
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
