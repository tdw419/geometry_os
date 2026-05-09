; DESCRIPTION: Renders a magenta line between points (494, 214) and (247, 178).
; PLAN: r0=494(x1), r1=214(y1), r2=247(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 214
LDI r2, 247
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
