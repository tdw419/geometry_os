; DESCRIPTION: Draws a cyan line from (194, 166) to (47, 5).
; PLAN: r0=194(x1), r1=166(y1), r2=47(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 166
LDI r2, 47
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
