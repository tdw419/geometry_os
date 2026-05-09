; DESCRIPTION: Places a green 74x119 rectangle at position (344, 27).
; PLAN: r0=344(x), r1=27(y), r2=74(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 27
LDI r2, 74
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
