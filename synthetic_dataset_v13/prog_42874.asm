; DESCRIPTION: Draws a cyan line from (334, 247) to (236, 216).
; PLAN: r0=334(x1), r1=247(y1), r2=236(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 247
LDI r2, 236
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
