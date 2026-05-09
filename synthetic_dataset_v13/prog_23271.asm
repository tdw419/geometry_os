; DESCRIPTION: Places a white 76x65 rectangle at position (108, 191).
; PLAN: r0=108(x), r1=191(y), r2=76(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 191
LDI r2, 76
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
