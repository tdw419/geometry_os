; DESCRIPTION: Renders a green line between points (202, 139) and (296, 28).
; PLAN: r0=202(x1), r1=139(y1), r2=296(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 139
LDI r2, 296
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
