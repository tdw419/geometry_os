; DESCRIPTION: Places a red 32x109 rectangle at position (382, 69).
; PLAN: r0=382(x), r1=69(y), r2=32(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 69
LDI r2, 32
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
