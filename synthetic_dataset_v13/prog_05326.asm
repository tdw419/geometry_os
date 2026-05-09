; DESCRIPTION: Renders a green line between points (263, 163) and (32, 12).
; PLAN: r0=263(x1), r1=163(y1), r2=32(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 163
LDI r2, 32
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
