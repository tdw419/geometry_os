; DESCRIPTION: Renders a green line between points (488, 197) and (197, 204).
; PLAN: r0=488(x1), r1=197(y1), r2=197(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 197
LDI r2, 197
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
