; DESCRIPTION: Places a cyan 115x32 rectangle at position (189, 206).
; PLAN: r0=189(x), r1=206(y), r2=115(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 206
LDI r2, 115
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
