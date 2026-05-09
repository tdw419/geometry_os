; DESCRIPTION: Renders a green line between points (168, 195) and (500, 253).
; PLAN: r0=168(x1), r1=195(y1), r2=500(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 195
LDI r2, 500
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
