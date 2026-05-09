; DESCRIPTION: Renders a white box of size 35x103 starting at (416, 13).
; PLAN: r0=416(x), r1=13(y), r2=35(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 13
LDI r2, 35
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
