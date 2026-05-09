; DESCRIPTION: Places a white 43x86 rectangle at position (258, 63).
; PLAN: r0=258(x), r1=63(y), r2=43(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 63
LDI r2, 43
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
