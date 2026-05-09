; DESCRIPTION: Renders a magenta line between points (90, 215) and (434, 220).
; PLAN: r0=90(x1), r1=215(y1), r2=434(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 215
LDI r2, 434
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
