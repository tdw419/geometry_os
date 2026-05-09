; DESCRIPTION: Renders a white box of size 57x45 starting at (140, 129).
; PLAN: r0=140(x), r1=129(y), r2=57(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 129
LDI r2, 57
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
