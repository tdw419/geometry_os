; DESCRIPTION: Places a green 78x105 rectangle at position (429, 96).
; PLAN: r0=429(x), r1=96(y), r2=78(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 96
LDI r2, 78
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
