; DESCRIPTION: Places a cyan 62x32 rectangle at position (421, 102).
; PLAN: r0=421(x), r1=102(y), r2=62(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 102
LDI r2, 62
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
