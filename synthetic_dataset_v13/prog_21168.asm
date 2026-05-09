; DESCRIPTION: Draws a cyan line from (280, 61) to (378, 101).
; PLAN: r0=280(x1), r1=61(y1), r2=378(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 61
LDI r2, 378
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
