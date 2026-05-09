; DESCRIPTION: Places a white 16x10 rectangle at position (296, 239).
; PLAN: r0=296(x), r1=239(y), r2=16(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 239
LDI r2, 16
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
