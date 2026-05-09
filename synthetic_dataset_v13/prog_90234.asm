; DESCRIPTION: Renders a blue line between points (387, 209) and (246, 167).
; PLAN: r0=387(x1), r1=209(y1), r2=246(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 209
LDI r2, 246
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
