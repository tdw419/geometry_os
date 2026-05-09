; DESCRIPTION: Places a magenta 10x30 rectangle at position (470, 24).
; PLAN: r0=470(x), r1=24(y), r2=10(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 24
LDI r2, 10
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
