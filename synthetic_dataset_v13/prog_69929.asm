; DESCRIPTION: Places a blue 120x120 rectangle at position (276, 126).
; PLAN: r0=276(x), r1=126(y), r2=120(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 126
LDI r2, 120
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
