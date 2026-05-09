; DESCRIPTION: Places a cyan 42x10 rectangle at position (4, 66).
; PLAN: r0=4(x), r1=66(y), r2=42(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 66
LDI r2, 42
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
