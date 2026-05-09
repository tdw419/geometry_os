; DESCRIPTION: Renders a white box of size 16x35 starting at (20, 98).
; PLAN: r0=20(x), r1=98(y), r2=16(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 98
LDI r2, 16
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
