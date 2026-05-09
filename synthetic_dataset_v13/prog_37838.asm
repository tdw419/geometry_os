; DESCRIPTION: Places a cyan 42x47 rectangle at position (407, 8).
; PLAN: r0=407(x), r1=8(y), r2=42(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 8
LDI r2, 42
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
