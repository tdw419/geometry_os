; DESCRIPTION: Places a red 10x93 rectangle at position (209, 83).
; PLAN: r0=209(x), r1=83(y), r2=10(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 83
LDI r2, 10
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
