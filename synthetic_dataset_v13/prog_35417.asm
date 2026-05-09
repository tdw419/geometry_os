; DESCRIPTION: Places a cyan 108x24 rectangle at position (346, 81).
; PLAN: r0=346(x), r1=81(y), r2=108(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 81
LDI r2, 108
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
