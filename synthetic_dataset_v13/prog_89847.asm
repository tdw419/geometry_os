; DESCRIPTION: Renders a magenta line between points (334, 27) and (494, 135).
; PLAN: r0=334(x1), r1=27(y1), r2=494(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 27
LDI r2, 494
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
