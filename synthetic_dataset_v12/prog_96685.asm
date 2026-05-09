; DESCRIPTION: Places a yellow 98x75 rectangle at position (226, 151).
; PLAN: r0=226(x), r1=151(y), r2=98(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 151
LDI r2, 98
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
