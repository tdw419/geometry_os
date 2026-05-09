; DESCRIPTION: Places a red 83x36 rectangle at position (285, 75).
; PLAN: r0=285(x), r1=75(y), r2=83(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 75
LDI r2, 83
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
