; DESCRIPTION: Places a cyan 13x65 rectangle at position (30, 156).
; PLAN: r0=30(x), r1=156(y), r2=13(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 156
LDI r2, 13
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
