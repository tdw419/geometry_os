; DESCRIPTION: Renders a white box of size 93x59 starting at (345, 104).
; PLAN: r0=345(x), r1=104(y), r2=93(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 104
LDI r2, 93
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
