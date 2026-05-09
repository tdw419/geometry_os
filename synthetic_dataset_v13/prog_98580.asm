; DESCRIPTION: Renders a white box of size 80x76 starting at (239, 133).
; PLAN: r0=239(x), r1=133(y), r2=80(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 133
LDI r2, 80
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
