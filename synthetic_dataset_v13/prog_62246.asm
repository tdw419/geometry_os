; DESCRIPTION: Renders a green line between points (430, 121) and (502, 42).
; PLAN: r0=430(x1), r1=121(y1), r2=502(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 121
LDI r2, 502
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
