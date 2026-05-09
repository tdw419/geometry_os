; DESCRIPTION: Renders a white line between points (42, 2) and (178, 193).
; PLAN: r0=42(x1), r1=2(y1), r2=178(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 2
LDI r2, 178
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
