; DESCRIPTION: Places a green 85x19 rectangle at position (355, 68).
; PLAN: r0=355(x), r1=68(y), r2=85(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 68
LDI r2, 85
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
