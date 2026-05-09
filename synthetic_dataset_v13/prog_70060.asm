; DESCRIPTION: Renders a green line between points (352, 226) and (86, 93).
; PLAN: r0=352(x1), r1=226(y1), r2=86(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 226
LDI r2, 86
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
