; DESCRIPTION: Renders a white box of size 95x37 starting at (150, 84).
; PLAN: r0=150(x), r1=84(y), r2=95(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 84
LDI r2, 95
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
