; DESCRIPTION: Renders a white box of size 120x71 starting at (250, 20).
; PLAN: r0=250(x), r1=20(y), r2=120(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 20
LDI r2, 120
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
