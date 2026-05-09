; DESCRIPTION: Renders a yellow line between points (284, 134) and (377, 177).
; PLAN: r0=284(x1), r1=134(y1), r2=377(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 134
LDI r2, 377
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
