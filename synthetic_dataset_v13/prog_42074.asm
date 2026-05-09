; DESCRIPTION: Places a red 26x57 rectangle at position (358, 59).
; PLAN: r0=358(x), r1=59(y), r2=26(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 59
LDI r2, 26
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
