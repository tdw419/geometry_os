; DESCRIPTION: Places a blue 56x38 rectangle at position (113, 172).
; PLAN: r0=113(x), r1=172(y), r2=56(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 172
LDI r2, 56
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
