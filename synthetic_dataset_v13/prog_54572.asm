; DESCRIPTION: Renders a green line between points (254, 228) and (375, 40).
; PLAN: r0=254(x1), r1=228(y1), r2=375(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 228
LDI r2, 375
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
