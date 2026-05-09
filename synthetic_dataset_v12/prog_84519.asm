; DESCRIPTION: Renders a green line between points (67, 42) and (346, 78).
; PLAN: r0=67(x1), r1=42(y1), r2=346(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 42
LDI r2, 346
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
