; DESCRIPTION: Places a cyan 100x39 rectangle at position (327, 203).
; PLAN: r0=327(x), r1=203(y), r2=100(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 203
LDI r2, 100
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
