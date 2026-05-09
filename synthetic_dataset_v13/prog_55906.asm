; DESCRIPTION: Places a cyan 42x60 rectangle at position (38, 32).
; PLAN: r0=38(x), r1=32(y), r2=42(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 32
LDI r2, 42
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
