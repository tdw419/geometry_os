; DESCRIPTION: Renders a white box of size 25x92 starting at (353, 30).
; PLAN: r0=353(x), r1=30(y), r2=25(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 30
LDI r2, 25
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
