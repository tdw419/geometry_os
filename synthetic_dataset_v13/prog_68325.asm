; DESCRIPTION: Places a red 46x23 rectangle at position (376, 147).
; PLAN: r0=376(x), r1=147(y), r2=46(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 147
LDI r2, 46
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
