; DESCRIPTION: Places a cyan 78x115 rectangle at position (319, 5).
; PLAN: r0=319(x), r1=5(y), r2=78(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 5
LDI r2, 78
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
