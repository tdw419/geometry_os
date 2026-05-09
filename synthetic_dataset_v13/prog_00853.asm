; DESCRIPTION: Places a white line segment connecting (42, 165) to (262, 62).
; PLAN: r0=42(x1), r1=165(y1), r2=262(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 165
LDI r2, 262
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
