; DESCRIPTION: Renders a magenta line between points (113, 164) and (275, 182).
; PLAN: r0=113(x1), r1=164(y1), r2=275(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 164
LDI r2, 275
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
