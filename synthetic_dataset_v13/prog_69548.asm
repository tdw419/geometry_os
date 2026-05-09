; DESCRIPTION: Places a cyan 53x90 rectangle at position (307, 61).
; PLAN: r0=307(x), r1=61(y), r2=53(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 61
LDI r2, 53
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
