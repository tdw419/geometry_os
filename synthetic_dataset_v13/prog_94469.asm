; DESCRIPTION: Places a blue 49x27 rectangle at position (117, 103).
; PLAN: r0=117(x), r1=103(y), r2=49(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 103
LDI r2, 49
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
