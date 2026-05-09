; DESCRIPTION: Renders a magenta line between points (59, 142) and (239, 134).
; PLAN: r0=59(x1), r1=142(y1), r2=239(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 142
LDI r2, 239
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
