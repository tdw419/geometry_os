; DESCRIPTION: Places a blue 27x30 rectangle at position (217, 122).
; PLAN: r0=217(x), r1=122(y), r2=27(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 122
LDI r2, 27
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
