; DESCRIPTION: Renders a yellow line between points (204, 228) and (48, 37).
; PLAN: r0=204(x1), r1=228(y1), r2=48(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 228
LDI r2, 48
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
