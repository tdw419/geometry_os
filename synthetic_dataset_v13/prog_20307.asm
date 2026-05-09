; DESCRIPTION: Renders a magenta line between points (492, 215) and (17, 57).
; PLAN: r0=492(x1), r1=215(y1), r2=17(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 215
LDI r2, 17
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
