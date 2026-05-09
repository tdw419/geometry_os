; DESCRIPTION: Renders a green line between points (221, 67) and (103, 49).
; PLAN: r0=221(x1), r1=67(y1), r2=103(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 67
LDI r2, 103
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
