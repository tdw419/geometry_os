; DESCRIPTION: Renders a white box of size 120x10 starting at (217, 158).
; PLAN: r0=217(x), r1=158(y), r2=120(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 158
LDI r2, 120
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
