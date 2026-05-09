; DESCRIPTION: Renders a magenta line between points (260, 228) and (281, 67).
; PLAN: r0=260(x1), r1=228(y1), r2=281(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 228
LDI r2, 281
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
