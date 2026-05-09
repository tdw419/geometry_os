; DESCRIPTION: Places a red 28x98 rectangle at position (252, 87).
; PLAN: r0=252(x), r1=87(y), r2=28(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 87
LDI r2, 28
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
