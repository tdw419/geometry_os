; DESCRIPTION: Renders a white box of size 116x91 starting at (176, 38).
; PLAN: r0=176(x), r1=38(y), r2=116(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 38
LDI r2, 116
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
