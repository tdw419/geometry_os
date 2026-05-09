; DESCRIPTION: Places a red 23x59 rectangle at position (378, 190).
; PLAN: r0=378(x), r1=190(y), r2=23(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 190
LDI r2, 23
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
