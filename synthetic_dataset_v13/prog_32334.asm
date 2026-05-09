; DESCRIPTION: Places a red 25x61 rectangle at position (251, 135).
; PLAN: r0=251(x), r1=135(y), r2=25(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 135
LDI r2, 25
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
