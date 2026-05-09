; DESCRIPTION: Places a red 78x107 rectangle at position (347, 19).
; PLAN: r0=347(x), r1=19(y), r2=78(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 19
LDI r2, 78
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
