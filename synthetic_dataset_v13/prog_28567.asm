; DESCRIPTION: Places a white 23x50 rectangle at position (204, 43).
; PLAN: r0=204(x), r1=43(y), r2=23(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 43
LDI r2, 23
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
