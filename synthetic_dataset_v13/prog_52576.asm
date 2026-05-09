; DESCRIPTION: Places a green 77x29 rectangle at position (355, 19).
; PLAN: r0=355(x), r1=19(y), r2=77(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 19
LDI r2, 77
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
