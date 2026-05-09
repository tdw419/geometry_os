; DESCRIPTION: Places a blue 26x72 rectangle at position (262, 150).
; PLAN: r0=262(x), r1=150(y), r2=26(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 150
LDI r2, 26
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
