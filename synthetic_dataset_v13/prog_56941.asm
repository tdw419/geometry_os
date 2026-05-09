; DESCRIPTION: Places a red 93x39 rectangle at position (351, 144).
; PLAN: r0=351(x), r1=144(y), r2=93(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 144
LDI r2, 93
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
