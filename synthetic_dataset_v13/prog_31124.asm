; DESCRIPTION: Renders a green line between points (481, 186) and (510, 212).
; PLAN: r0=481(x1), r1=186(y1), r2=510(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 186
LDI r2, 510
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
