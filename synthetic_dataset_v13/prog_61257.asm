; DESCRIPTION: Renders a magenta line between points (349, 228) and (368, 50).
; PLAN: r0=349(x1), r1=228(y1), r2=368(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 228
LDI r2, 368
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
