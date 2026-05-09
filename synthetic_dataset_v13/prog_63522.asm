; DESCRIPTION: Renders a red line between points (187, 8) and (280, 208).
; PLAN: r0=187(x1), r1=8(y1), r2=280(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 8
LDI r2, 280
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
