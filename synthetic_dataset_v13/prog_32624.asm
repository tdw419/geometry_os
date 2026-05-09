; DESCRIPTION: Places a cyan 49x11 rectangle at position (429, 199).
; PLAN: r0=429(x), r1=199(y), r2=49(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 199
LDI r2, 49
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
