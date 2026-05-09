; DESCRIPTION: Places a red 72x99 rectangle at position (326, 147).
; PLAN: r0=326(x), r1=147(y), r2=72(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 147
LDI r2, 72
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
