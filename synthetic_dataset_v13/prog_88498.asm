; DESCRIPTION: Renders a red line between points (183, 126) and (127, 19).
; PLAN: r0=183(x1), r1=126(y1), r2=127(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 126
LDI r2, 127
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
