; DESCRIPTION: Draws a red line from (138, 28) to (195, 124).
; PLAN: r0=138(x1), r1=28(y1), r2=195(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 28
LDI r2, 195
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
