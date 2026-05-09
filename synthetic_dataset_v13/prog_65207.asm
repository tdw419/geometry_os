; DESCRIPTION: Places a cyan 101x88 rectangle at position (285, 27).
; PLAN: r0=285(x), r1=27(y), r2=101(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 27
LDI r2, 101
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
