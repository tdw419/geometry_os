; DESCRIPTION: Places a white 69x98 rectangle at position (107, 17).
; PLAN: r0=107(x), r1=17(y), r2=69(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 17
LDI r2, 69
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
