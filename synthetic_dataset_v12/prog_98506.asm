; DESCRIPTION: Renders a white box of size 113x62 starting at (116, 156).
; PLAN: r0=116(x), r1=156(y), r2=113(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 156
LDI r2, 113
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
