; DESCRIPTION: Renders a green line between points (382, 32) and (315, 197).
; PLAN: r0=382(x1), r1=32(y1), r2=315(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 32
LDI r2, 315
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
