; DESCRIPTION: Renders a red line between points (362, 72) and (98, 243).
; PLAN: r0=362(x1), r1=72(y1), r2=98(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 72
LDI r2, 98
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
