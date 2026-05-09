; DESCRIPTION: Places a green 18x17 rectangle at position (334, 32).
; PLAN: r0=334(x), r1=32(y), r2=18(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 32
LDI r2, 18
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
