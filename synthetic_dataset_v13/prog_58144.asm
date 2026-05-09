; DESCRIPTION: Renders a white line between points (426, 236) and (362, 243).
; PLAN: r0=426(x1), r1=236(y1), r2=362(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 236
LDI r2, 362
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
