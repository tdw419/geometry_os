; DESCRIPTION: Renders a green line between points (56, 53) and (228, 47).
; PLAN: r0=56(x1), r1=53(y1), r2=228(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 53
LDI r2, 228
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
