; DESCRIPTION: Places a white 62x74 rectangle at position (225, 63).
; PLAN: r0=225(x), r1=63(y), r2=62(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 63
LDI r2, 62
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
