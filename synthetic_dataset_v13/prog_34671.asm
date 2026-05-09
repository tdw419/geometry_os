; DESCRIPTION: Draws a cyan line from (35, 140) to (381, 47).
; PLAN: r0=35(x1), r1=140(y1), r2=381(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 140
LDI r2, 381
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
