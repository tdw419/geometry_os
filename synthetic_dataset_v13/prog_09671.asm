; DESCRIPTION: Places a red 45x59 rectangle at position (126, 3).
; PLAN: r0=126(x), r1=3(y), r2=45(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 3
LDI r2, 45
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
