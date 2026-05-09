; DESCRIPTION: Renders a white line between points (259, 33) and (42, 234).
; PLAN: r0=259(x1), r1=33(y1), r2=42(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 33
LDI r2, 42
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
