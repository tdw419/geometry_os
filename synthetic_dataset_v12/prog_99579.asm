; DESCRIPTION: Renders a white box of size 16x38 starting at (128, 56).
; PLAN: r0=128(x), r1=56(y), r2=16(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 56
LDI r2, 16
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
