; DESCRIPTION: Renders a blue line between points (226, 32) and (284, 186).
; PLAN: r0=226(x1), r1=32(y1), r2=284(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 32
LDI r2, 284
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
