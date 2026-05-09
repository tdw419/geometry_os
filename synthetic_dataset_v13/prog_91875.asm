; DESCRIPTION: Places a cyan 42x19 rectangle at position (359, 8).
; PLAN: r0=359(x), r1=8(y), r2=42(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 8
LDI r2, 42
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
