; DESCRIPTION: Renders a red line between points (23, 138) and (290, 132).
; PLAN: r0=23(x1), r1=138(y1), r2=290(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 138
LDI r2, 290
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
