; DESCRIPTION: Places a black 37x93 rectangle at position (474, 144).
; PLAN: r0=474(x), r1=144(y), r2=37(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 144
LDI r2, 37
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
