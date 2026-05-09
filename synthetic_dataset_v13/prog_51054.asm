; DESCRIPTION: Places a cyan 60x43 rectangle at position (452, 172).
; PLAN: r0=452(x), r1=172(y), r2=60(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 172
LDI r2, 60
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
