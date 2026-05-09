; DESCRIPTION: Places a red 120x23 rectangle at position (355, 176).
; PLAN: r0=355(x), r1=176(y), r2=120(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 176
LDI r2, 120
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
