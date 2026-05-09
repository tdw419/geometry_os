; DESCRIPTION: Draws a cyan line from (37, 2) to (483, 209).
; PLAN: r0=37(x1), r1=2(y1), r2=483(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 2
LDI r2, 483
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
