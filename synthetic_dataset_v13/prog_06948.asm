; DESCRIPTION: Renders a magenta line between points (176, 124) and (167, 60).
; PLAN: r0=176(x1), r1=124(y1), r2=167(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 124
LDI r2, 167
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
