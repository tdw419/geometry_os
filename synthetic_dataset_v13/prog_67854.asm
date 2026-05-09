; DESCRIPTION: Places a white 87x54 rectangle at position (17, 131).
; PLAN: r0=17(x), r1=131(y), r2=87(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 131
LDI r2, 87
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
