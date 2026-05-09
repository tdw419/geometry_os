; DESCRIPTION: Places a cyan 73x42 rectangle at position (324, 137).
; PLAN: r0=324(x), r1=137(y), r2=73(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 137
LDI r2, 73
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
