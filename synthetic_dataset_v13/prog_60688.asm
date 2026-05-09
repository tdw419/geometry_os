; DESCRIPTION: Places a yellow 34x70 rectangle at position (376, 8).
; PLAN: r0=376(x), r1=8(y), r2=34(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 8
LDI r2, 34
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
