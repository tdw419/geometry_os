; DESCRIPTION: Places a blue 27x72 rectangle at position (376, 103).
; PLAN: r0=376(x), r1=103(y), r2=27(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 103
LDI r2, 27
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
