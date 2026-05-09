; DESCRIPTION: Places a white 64x43 rectangle at position (186, 69).
; PLAN: r0=186(x), r1=69(y), r2=64(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 69
LDI r2, 64
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
