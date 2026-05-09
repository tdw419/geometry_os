; DESCRIPTION: Places a blue 75x95 rectangle at position (154, 153).
; PLAN: r0=154(x), r1=153(y), r2=75(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 153
LDI r2, 75
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
