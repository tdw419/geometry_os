; DESCRIPTION: Draws a white line from (386, 182) to (159, 127).
; PLAN: r0=386(x1), r1=182(y1), r2=159(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 182
LDI r2, 159
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
