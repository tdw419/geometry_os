; DESCRIPTION: Places a cyan 61x14 rectangle at position (203, 147).
; PLAN: r0=203(x), r1=147(y), r2=61(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 147
LDI r2, 61
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
