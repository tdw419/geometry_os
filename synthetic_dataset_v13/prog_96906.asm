; DESCRIPTION: Places a cyan 70x96 rectangle at position (307, 44).
; PLAN: r0=307(x), r1=44(y), r2=70(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 44
LDI r2, 70
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
