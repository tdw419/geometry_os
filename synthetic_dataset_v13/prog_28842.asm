; DESCRIPTION: Renders a orange line between points (294, 111) and (481, 74).
; PLAN: r0=294(x1), r1=111(y1), r2=481(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 111
LDI r2, 481
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
