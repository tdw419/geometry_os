; DESCRIPTION: Renders a yellow line between points (104, 228) and (64, 36).
; PLAN: r0=104(x1), r1=228(y1), r2=64(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 228
LDI r2, 64
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
