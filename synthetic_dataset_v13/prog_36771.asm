; DESCRIPTION: Places a white 62x18 rectangle at position (160, 45).
; PLAN: r0=160(x), r1=45(y), r2=62(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 45
LDI r2, 62
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
