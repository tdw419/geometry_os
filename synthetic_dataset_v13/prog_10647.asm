; DESCRIPTION: Renders a red line between points (345, 202) and (243, 174).
; PLAN: r0=345(x1), r1=202(y1), r2=243(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 202
LDI r2, 243
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
