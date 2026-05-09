; DESCRIPTION: Renders a magenta line between points (35, 239) and (436, 166).
; PLAN: r0=35(x1), r1=239(y1), r2=436(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 239
LDI r2, 436
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
