; DESCRIPTION: Places a red 105x83 rectangle at position (280, 140).
; PLAN: r0=280(x), r1=140(y), r2=105(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 140
LDI r2, 105
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
