; DESCRIPTION: Draws a white line from (486, 182) to (228, 56).
; PLAN: r0=486(x1), r1=182(y1), r2=228(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 182
LDI r2, 228
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
