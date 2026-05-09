; DESCRIPTION: Places a cyan 98x48 rectangle at position (232, 101).
; PLAN: r0=232(x), r1=101(y), r2=98(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 101
LDI r2, 98
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
