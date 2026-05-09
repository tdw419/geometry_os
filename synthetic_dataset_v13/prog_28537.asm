; DESCRIPTION: Places a red 78x57 rectangle at position (173, 75).
; PLAN: r0=173(x), r1=75(y), r2=78(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 75
LDI r2, 78
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
