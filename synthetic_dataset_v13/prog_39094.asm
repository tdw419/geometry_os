; DESCRIPTION: Renders a yellow line between points (203, 42) and (27, 45).
; PLAN: r0=203(x1), r1=42(y1), r2=27(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 42
LDI r2, 27
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
