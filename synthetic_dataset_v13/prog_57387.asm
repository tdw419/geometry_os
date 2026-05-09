; DESCRIPTION: Places a white 56x50 rectangle at position (296, 181).
; PLAN: r0=296(x), r1=181(y), r2=56(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 181
LDI r2, 56
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
