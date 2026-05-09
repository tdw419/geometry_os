; DESCRIPTION: Places a blue 103x59 rectangle at position (141, 50).
; PLAN: r0=141(x), r1=50(y), r2=103(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 50
LDI r2, 103
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
