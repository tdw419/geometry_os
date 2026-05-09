; DESCRIPTION: Places a green 21x54 rectangle at position (355, 5).
; PLAN: r0=355(x), r1=5(y), r2=21(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 5
LDI r2, 21
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
