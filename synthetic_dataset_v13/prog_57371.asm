; DESCRIPTION: Renders a magenta line between points (18, 138) and (276, 174).
; PLAN: r0=18(x1), r1=138(y1), r2=276(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 138
LDI r2, 276
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
