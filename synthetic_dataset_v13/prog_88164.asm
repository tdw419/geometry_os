; DESCRIPTION: Places a white 69x98 rectangle at position (170, 139).
; PLAN: r0=170(x), r1=139(y), r2=69(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 139
LDI r2, 69
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
