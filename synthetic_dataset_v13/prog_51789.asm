; DESCRIPTION: Places a cyan 42x32 rectangle at position (413, 147).
; PLAN: r0=413(x), r1=147(y), r2=42(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 147
LDI r2, 42
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
