; DESCRIPTION: Renders a green line between points (30, 213) and (154, 237).
; PLAN: r0=30(x1), r1=213(y1), r2=154(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 213
LDI r2, 154
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
