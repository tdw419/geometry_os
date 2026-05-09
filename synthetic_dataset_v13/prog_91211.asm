; DESCRIPTION: Draws a white line from (292, 138) to (208, 139).
; PLAN: r0=292(x1), r1=138(y1), r2=208(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 138
LDI r2, 208
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
