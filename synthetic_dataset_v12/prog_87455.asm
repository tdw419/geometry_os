; DESCRIPTION: Places a white 88x88 rectangle at position (236, 48).
; PLAN: r0=236(x), r1=48(y), r2=88(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 48
LDI r2, 88
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
