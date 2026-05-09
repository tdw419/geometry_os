; DESCRIPTION: Renders a white box of size 108x32 starting at (189, 21).
; PLAN: r0=189(x), r1=21(y), r2=108(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 21
LDI r2, 108
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
