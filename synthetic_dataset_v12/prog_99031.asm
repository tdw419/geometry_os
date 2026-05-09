; DESCRIPTION: Renders a magenta line between points (50, 92) and (384, 134).
; PLAN: r0=50(x1), r1=92(y1), r2=384(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 92
LDI r2, 384
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
