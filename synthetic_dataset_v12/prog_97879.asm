; DESCRIPTION: Places a cyan 53x45 rectangle at position (395, 42).
; PLAN: r0=395(x), r1=42(y), r2=53(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 42
LDI r2, 53
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
