; DESCRIPTION: Places a red 107x71 rectangle at position (388, 3).
; PLAN: r0=388(x), r1=3(y), r2=107(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 3
LDI r2, 107
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
