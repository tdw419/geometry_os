; DESCRIPTION: Places a white 46x18 rectangle at position (83, 128).
; PLAN: r0=83(x), r1=128(y), r2=46(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 128
LDI r2, 46
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
