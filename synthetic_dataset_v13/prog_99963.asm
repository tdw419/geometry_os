; DESCRIPTION: Places a cyan 95x30 rectangle at position (74, 39).
; PLAN: r0=74(x), r1=39(y), r2=95(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 39
LDI r2, 95
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
