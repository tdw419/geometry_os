; DESCRIPTION: Places a red 108x66 rectangle at position (354, 189).
; PLAN: r0=354(x), r1=189(y), r2=108(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 189
LDI r2, 108
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
