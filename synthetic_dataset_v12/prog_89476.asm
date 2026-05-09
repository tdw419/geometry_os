; DESCRIPTION: Places a blue 90x103 rectangle at position (59, 68).
; PLAN: r0=59(x), r1=68(y), r2=90(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 68
LDI r2, 90
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
