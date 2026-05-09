; DESCRIPTION: Places a black 50x74 rectangle at position (283, 170).
; PLAN: r0=283(x), r1=170(y), r2=50(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 170
LDI r2, 50
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
