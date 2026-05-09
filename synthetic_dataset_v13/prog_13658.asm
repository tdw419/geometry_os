; DESCRIPTION: Renders a white box of size 42x55 starting at (185, 88).
; PLAN: r0=185(x), r1=88(y), r2=42(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 88
LDI r2, 42
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
