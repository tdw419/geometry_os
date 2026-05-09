; DESCRIPTION: Places a cyan 70x98 rectangle at position (429, 78).
; PLAN: r0=429(x), r1=78(y), r2=70(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 78
LDI r2, 70
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
