; DESCRIPTION: Places a cyan 26x64 rectangle at position (308, 90).
; PLAN: r0=308(x), r1=90(y), r2=26(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 90
LDI r2, 26
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
