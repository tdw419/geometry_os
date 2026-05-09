; DESCRIPTION: Places a yellow 62x12 rectangle at position (85, 241).
; PLAN: r0=85(x), r1=241(y), r2=62(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 241
LDI r2, 62
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
