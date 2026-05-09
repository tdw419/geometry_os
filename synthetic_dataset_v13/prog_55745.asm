; DESCRIPTION: Places a white 13x20 rectangle at position (256, 76).
; PLAN: r0=256(x), r1=76(y), r2=13(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 76
LDI r2, 13
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
