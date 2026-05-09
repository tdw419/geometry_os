; DESCRIPTION: Renders a magenta line between points (70, 253) and (481, 210).
; PLAN: r0=70(x1), r1=253(y1), r2=481(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 253
LDI r2, 481
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
