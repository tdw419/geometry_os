; DESCRIPTION: Renders a white box of size 74x103 starting at (128, 59).
; PLAN: r0=128(x), r1=59(y), r2=74(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 59
LDI r2, 74
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
