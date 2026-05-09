; DESCRIPTION: Places a red 93x104 rectangle at position (28, 128).
; PLAN: r0=28(x), r1=128(y), r2=93(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 128
LDI r2, 93
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
