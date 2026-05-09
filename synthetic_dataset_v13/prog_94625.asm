; DESCRIPTION: Renders a green line between points (52, 228) and (400, 126).
; PLAN: r0=52(x1), r1=228(y1), r2=400(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 228
LDI r2, 400
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
