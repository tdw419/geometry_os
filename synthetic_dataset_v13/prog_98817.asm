; DESCRIPTION: Places a yellow 62x95 rectangle at position (126, 75).
; PLAN: r0=126(x), r1=75(y), r2=62(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 75
LDI r2, 62
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
