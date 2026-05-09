; DESCRIPTION: Renders a magenta line between points (228, 73) and (285, 177).
; PLAN: r0=228(x1), r1=73(y1), r2=285(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 73
LDI r2, 285
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
