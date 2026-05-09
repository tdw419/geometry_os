; DESCRIPTION: Renders a cyan line between points (13, 140) and (418, 29).
; PLAN: r0=13(x1), r1=140(y1), r2=418(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 140
LDI r2, 418
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
