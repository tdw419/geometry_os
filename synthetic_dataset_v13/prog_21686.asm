; DESCRIPTION: Places a white 98x114 rectangle at position (156, 90).
; PLAN: r0=156(x), r1=90(y), r2=98(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 90
LDI r2, 98
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
