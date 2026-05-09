; DESCRIPTION: Renders a white box of size 24x12 starting at (112, 220).
; PLAN: r0=112(x), r1=220(y), r2=24(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 220
LDI r2, 24
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
