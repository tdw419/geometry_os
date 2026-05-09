; DESCRIPTION: Draws a cyan line from (389, 127) to (452, 170).
; PLAN: r0=389(x1), r1=127(y1), r2=452(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 127
LDI r2, 452
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
