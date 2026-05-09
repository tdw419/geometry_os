; DESCRIPTION: Places a red 101x24 rectangle at position (285, 47).
; PLAN: r0=285(x), r1=47(y), r2=101(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 47
LDI r2, 101
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
