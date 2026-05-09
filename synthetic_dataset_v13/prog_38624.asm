; DESCRIPTION: Places a cyan 11x59 rectangle at position (232, 15).
; PLAN: r0=232(x), r1=15(y), r2=11(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 15
LDI r2, 11
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
