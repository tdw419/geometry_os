; DESCRIPTION: Renders a magenta line between points (204, 228) and (317, 48).
; PLAN: r0=204(x1), r1=228(y1), r2=317(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 228
LDI r2, 317
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
