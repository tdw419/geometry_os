; DESCRIPTION: Places a cyan 100x39 rectangle at position (256, 162).
; PLAN: r0=256(x), r1=162(y), r2=100(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 162
LDI r2, 100
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
