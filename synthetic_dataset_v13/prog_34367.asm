; DESCRIPTION: Renders a white line between points (497, 67) and (412, 246).
; PLAN: r0=497(x1), r1=67(y1), r2=412(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 67
LDI r2, 412
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
