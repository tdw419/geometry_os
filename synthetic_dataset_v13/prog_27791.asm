; DESCRIPTION: Places a cyan 84x61 rectangle at position (117, 102).
; PLAN: r0=117(x), r1=102(y), r2=84(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 102
LDI r2, 84
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
