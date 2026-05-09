; DESCRIPTION: Places a white 10x23 rectangle at position (472, 37).
; PLAN: r0=472(x), r1=37(y), r2=10(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 37
LDI r2, 10
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
