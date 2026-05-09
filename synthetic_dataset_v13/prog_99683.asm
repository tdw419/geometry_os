; DESCRIPTION: Places a white 62x79 rectangle at position (17, 108).
; PLAN: r0=17(x), r1=108(y), r2=62(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 108
LDI r2, 62
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
