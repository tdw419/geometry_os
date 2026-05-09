; DESCRIPTION: Places a orange 98x45 rectangle at position (355, 101).
; PLAN: r0=355(x), r1=101(y), r2=98(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 101
LDI r2, 98
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
