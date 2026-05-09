; DESCRIPTION: Renders a red line between points (362, 114) and (113, 36).
; PLAN: r0=362(x1), r1=114(y1), r2=113(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 114
LDI r2, 113
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
