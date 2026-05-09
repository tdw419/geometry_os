; DESCRIPTION: Places a white 76x105 rectangle at position (344, 64).
; PLAN: r0=344(x), r1=64(y), r2=76(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 64
LDI r2, 76
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
