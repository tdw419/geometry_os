; DESCRIPTION: Renders a white box of size 120x40 starting at (233, 96).
; PLAN: r0=233(x), r1=96(y), r2=120(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 96
LDI r2, 120
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
