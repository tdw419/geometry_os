; DESCRIPTION: Places a cyan 38x49 rectangle at position (421, 93).
; PLAN: r0=421(x), r1=93(y), r2=38(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 93
LDI r2, 38
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
