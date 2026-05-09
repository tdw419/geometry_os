; DESCRIPTION: Places a cyan line segment connecting (262, 201) to (42, 16).
; PLAN: r0=262(x1), r1=201(y1), r2=42(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 201
LDI r2, 42
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
