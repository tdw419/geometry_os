; DESCRIPTION: Renders a green line between points (352, 75) and (243, 193).
; PLAN: r0=352(x1), r1=75(y1), r2=243(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 75
LDI r2, 243
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
