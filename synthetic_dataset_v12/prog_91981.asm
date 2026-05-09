; DESCRIPTION: Renders a white box of size 24x90 starting at (96, 129).
; PLAN: r0=96(x), r1=129(y), r2=24(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 129
LDI r2, 24
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
