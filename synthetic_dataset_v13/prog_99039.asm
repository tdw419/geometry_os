; DESCRIPTION: Renders a white box of size 114x25 starting at (92, 103).
; PLAN: r0=92(x), r1=103(y), r2=114(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 103
LDI r2, 114
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
