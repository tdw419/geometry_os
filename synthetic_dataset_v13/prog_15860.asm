; DESCRIPTION: Places a yellow 61x54 rectangle at position (31, 176).
; PLAN: r0=31(x), r1=176(y), r2=61(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 176
LDI r2, 61
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
