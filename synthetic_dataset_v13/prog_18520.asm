; DESCRIPTION: Places a white 87x99 rectangle at position (342, 128).
; PLAN: r0=342(x), r1=128(y), r2=87(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 128
LDI r2, 87
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
