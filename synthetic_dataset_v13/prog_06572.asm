; DESCRIPTION: Draws a cyan line from (424, 60) to (270, 102).
; PLAN: r0=424(x1), r1=60(y1), r2=270(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 60
LDI r2, 270
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
