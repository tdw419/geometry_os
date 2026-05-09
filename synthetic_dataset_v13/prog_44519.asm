; DESCRIPTION: Renders a green line between points (32, 82) and (33, 28).
; PLAN: r0=32(x1), r1=82(y1), r2=33(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 82
LDI r2, 33
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
