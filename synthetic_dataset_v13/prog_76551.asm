; DESCRIPTION: Places a magenta 42x25 rectangle at position (42, 153).
; PLAN: r0=42(x), r1=153(y), r2=42(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 153
LDI r2, 42
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
