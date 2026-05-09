; DESCRIPTION: Draws a red line from (311, 165) to (386, 53).
; PLAN: r0=311(x1), r1=165(y1), r2=386(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 165
LDI r2, 386
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
