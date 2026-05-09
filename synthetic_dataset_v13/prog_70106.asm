; DESCRIPTION: Places a red 75x45 rectangle at position (59, 101).
; PLAN: r0=59(x), r1=101(y), r2=75(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 101
LDI r2, 75
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
