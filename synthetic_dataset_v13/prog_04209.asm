; DESCRIPTION: Places a cyan 42x87 rectangle at position (270, 165).
; PLAN: r0=270(x), r1=165(y), r2=42(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 165
LDI r2, 42
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
