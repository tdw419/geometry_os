; DESCRIPTION: Renders a white box of size 50x92 starting at (250, 97).
; PLAN: r0=250(x), r1=97(y), r2=50(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 97
LDI r2, 50
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
