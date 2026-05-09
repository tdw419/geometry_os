; DESCRIPTION: Places a cyan 19x50 rectangle at position (388, 102).
; PLAN: r0=388(x), r1=102(y), r2=19(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 102
LDI r2, 19
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
