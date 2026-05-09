; DESCRIPTION: Renders a white box of size 37x103 starting at (30, 33).
; PLAN: r0=30(x), r1=33(y), r2=37(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 33
LDI r2, 37
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
