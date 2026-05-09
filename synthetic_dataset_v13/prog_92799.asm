; DESCRIPTION: Renders a white box of size 30x76 starting at (222, 82).
; PLAN: r0=222(x), r1=82(y), r2=30(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 82
LDI r2, 30
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
