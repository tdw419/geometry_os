; DESCRIPTION: Renders a magenta line between points (511, 111) and (184, 5).
; PLAN: r0=511(x1), r1=111(y1), r2=184(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 111
LDI r2, 184
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
