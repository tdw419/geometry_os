; DESCRIPTION: Places a white 21x23 rectangle at position (17, 70).
; PLAN: r0=17(x), r1=70(y), r2=21(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 70
LDI r2, 21
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
