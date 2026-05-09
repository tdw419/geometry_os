; DESCRIPTION: Renders a green line between points (299, 53) and (509, 64).
; PLAN: r0=299(x1), r1=53(y1), r2=509(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 53
LDI r2, 509
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
