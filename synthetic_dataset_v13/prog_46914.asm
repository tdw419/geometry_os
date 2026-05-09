; DESCRIPTION: Places a blue 42x111 rectangle at position (192, 106).
; PLAN: r0=192(x), r1=106(y), r2=42(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 106
LDI r2, 42
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
