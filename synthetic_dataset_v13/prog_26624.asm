; DESCRIPTION: Places a white 66x64 rectangle at position (418, 56).
; PLAN: r0=418(x), r1=56(y), r2=66(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 56
LDI r2, 66
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
