; DESCRIPTION: Places a yellow 90x42 rectangle at position (299, 37).
; PLAN: r0=299(x), r1=37(y), r2=90(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 37
LDI r2, 90
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
