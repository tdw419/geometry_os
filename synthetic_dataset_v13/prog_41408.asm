; DESCRIPTION: Renders a black line between points (52, 210) and (113, 246).
; PLAN: r0=52(x1), r1=210(y1), r2=113(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 210
LDI r2, 113
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
