; DESCRIPTION: Places a cyan 115x33 rectangle at position (336, 183).
; PLAN: r0=336(x), r1=183(y), r2=115(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 183
LDI r2, 115
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
