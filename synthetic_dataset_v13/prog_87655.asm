; DESCRIPTION: Draws a cyan line from (266, 243) to (90, 163).
; PLAN: r0=266(x1), r1=243(y1), r2=90(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 243
LDI r2, 90
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
