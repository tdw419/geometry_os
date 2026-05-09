; DESCRIPTION: Places a green 13x30 rectangle at position (494, 166).
; PLAN: r0=494(x), r1=166(y), r2=13(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 166
LDI r2, 13
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
