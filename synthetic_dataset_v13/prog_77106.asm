; DESCRIPTION: Renders a green line between points (284, 245) and (313, 116).
; PLAN: r0=284(x1), r1=245(y1), r2=313(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 245
LDI r2, 313
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
