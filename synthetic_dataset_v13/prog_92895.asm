; DESCRIPTION: Renders a red line between points (242, 71) and (59, 132).
; PLAN: r0=242(x1), r1=71(y1), r2=59(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 71
LDI r2, 59
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
