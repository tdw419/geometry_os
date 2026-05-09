; DESCRIPTION: Places a blue 72x52 rectangle at position (103, 15).
; PLAN: r0=103(x), r1=15(y), r2=72(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 15
LDI r2, 72
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
