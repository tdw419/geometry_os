; DESCRIPTION: Places a red 47x24 rectangle at position (201, 166).
; PLAN: r0=201(x), r1=166(y), r2=47(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 166
LDI r2, 47
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
