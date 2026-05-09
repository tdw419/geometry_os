; DESCRIPTION: Places a cyan 96x42 rectangle at position (62, 16).
; PLAN: r0=62(x), r1=16(y), r2=96(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 16
LDI r2, 96
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
