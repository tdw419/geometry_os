; DESCRIPTION: Renders a white line between points (67, 215) and (187, 53).
; PLAN: r0=67(x1), r1=215(y1), r2=187(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 215
LDI r2, 187
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
