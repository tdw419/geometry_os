; DESCRIPTION: Renders a white box of size 114x90 starting at (75, 5).
; PLAN: r0=75(x), r1=5(y), r2=114(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 5
LDI r2, 114
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
