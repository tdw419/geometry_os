; DESCRIPTION: Places a white 43x16 rectangle at position (134, 60).
; PLAN: r0=134(x), r1=60(y), r2=43(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 60
LDI r2, 43
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
