; DESCRIPTION: Places a yellow 32x96 rectangle at position (355, 98).
; PLAN: r0=355(x), r1=98(y), r2=32(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 98
LDI r2, 32
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
