; DESCRIPTION: Renders a yellow line between points (375, 228) and (210, 152).
; PLAN: r0=375(x1), r1=228(y1), r2=210(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 228
LDI r2, 210
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
