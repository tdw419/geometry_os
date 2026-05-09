; DESCRIPTION: Renders a green line between points (42, 53) and (193, 210).
; PLAN: r0=42(x1), r1=53(y1), r2=193(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 53
LDI r2, 193
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
