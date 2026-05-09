; DESCRIPTION: Places a red 82x67 rectangle at position (285, 87).
; PLAN: r0=285(x), r1=87(y), r2=82(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 87
LDI r2, 82
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
