; DESCRIPTION: Places a red 20x23 rectangle at position (59, 0).
; PLAN: r0=59(x), r1=0(y), r2=20(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 0
LDI r2, 20
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
