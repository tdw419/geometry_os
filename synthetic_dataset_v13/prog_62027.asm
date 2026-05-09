; DESCRIPTION: Draws a cyan line from (124, 90) to (319, 140).
; PLAN: r0=124(x1), r1=90(y1), r2=319(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 90
LDI r2, 319
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
