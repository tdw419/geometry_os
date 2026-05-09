; DESCRIPTION: Places a red 78x96 rectangle at position (305, 43).
; PLAN: r0=305(x), r1=43(y), r2=78(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 43
LDI r2, 78
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
