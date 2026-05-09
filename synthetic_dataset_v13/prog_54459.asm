; DESCRIPTION: Places a white 64x62 rectangle at position (46, 43).
; PLAN: r0=46(x), r1=43(y), r2=64(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 43
LDI r2, 64
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
