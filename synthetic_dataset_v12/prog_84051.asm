; DESCRIPTION: Renders a white box of size 14x115 starting at (150, 26).
; PLAN: r0=150(x), r1=26(y), r2=14(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 26
LDI r2, 14
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
