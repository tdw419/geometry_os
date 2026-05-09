; DESCRIPTION: Places a blue 110x42 rectangle at position (242, 101).
; PLAN: r0=242(x), r1=101(y), r2=110(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 101
LDI r2, 110
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
