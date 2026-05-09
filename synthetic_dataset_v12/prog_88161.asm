; DESCRIPTION: Draws a cyan line from (292, 102) to (105, 57).
; PLAN: r0=292(x1), r1=102(y1), r2=105(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 102
LDI r2, 105
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
