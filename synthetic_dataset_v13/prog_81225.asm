; DESCRIPTION: Places a yellow 87x42 rectangle at position (8, 164).
; PLAN: r0=8(x), r1=164(y), r2=87(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 164
LDI r2, 87
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
