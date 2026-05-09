; DESCRIPTION: Places a white 26x60 rectangle at position (64, 50).
; PLAN: r0=64(x), r1=50(y), r2=26(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 50
LDI r2, 26
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
