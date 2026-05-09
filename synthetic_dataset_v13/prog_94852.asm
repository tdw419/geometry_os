; DESCRIPTION: Renders a orange line between points (210, 237) and (202, 186).
; PLAN: r0=210(x1), r1=237(y1), r2=202(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 237
LDI r2, 202
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
