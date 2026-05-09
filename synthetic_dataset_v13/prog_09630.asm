; DESCRIPTION: Places a red 78x48 rectangle at position (373, 62).
; PLAN: r0=373(x), r1=62(y), r2=78(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 62
LDI r2, 78
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
