; DESCRIPTION: Creates a yellow rectangular region at (434, 32) spanning 61 by 93 pixels.
; PLAN: r0=434(x), r1=32(y), r2=61(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 32
LDI r2, 61
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
