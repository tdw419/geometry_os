; DESCRIPTION: Renders a green line between points (210, 219) and (411, 177).
; PLAN: r0=210(x1), r1=219(y1), r2=411(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 219
LDI r2, 411
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
