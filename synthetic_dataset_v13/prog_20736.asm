; DESCRIPTION: Renders a yellow line between points (228, 111) and (308, 143).
; PLAN: r0=228(x1), r1=111(y1), r2=308(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 111
LDI r2, 308
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
