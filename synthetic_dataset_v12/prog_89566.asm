; DESCRIPTION: Renders a magenta line between points (35, 215) and (165, 16).
; PLAN: r0=35(x1), r1=215(y1), r2=165(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 215
LDI r2, 165
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
