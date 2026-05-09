; DESCRIPTION: Places a red 83x92 rectangle at position (171, 122).
; PLAN: r0=171(x), r1=122(y), r2=83(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 122
LDI r2, 83
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
