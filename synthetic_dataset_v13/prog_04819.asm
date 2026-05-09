; DESCRIPTION: Draws a white rectangle at (262, 56) with width 82 and height 16.
; PLAN: r0=262(x), r1=56(y), r2=82(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 56
LDI r2, 82
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
