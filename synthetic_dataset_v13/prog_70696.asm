; DESCRIPTION: Renders a magenta line between points (293, 239) and (1, 69).
; PLAN: r0=293(x1), r1=239(y1), r2=1(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 239
LDI r2, 1
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
