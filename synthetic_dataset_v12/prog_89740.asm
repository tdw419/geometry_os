; DESCRIPTION: Renders a white box of size 108x50 starting at (264, 189).
; PLAN: r0=264(x), r1=189(y), r2=108(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 189
LDI r2, 108
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
