; DESCRIPTION: Places a cyan 33x30 rectangle at position (128, 25).
; PLAN: r0=128(x), r1=25(y), r2=33(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 25
LDI r2, 33
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
