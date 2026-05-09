; DESCRIPTION: Places a yellow 37x30 rectangle at position (88, 39).
; PLAN: r0=88(x), r1=39(y), r2=37(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 39
LDI r2, 37
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
