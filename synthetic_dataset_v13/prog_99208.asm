; DESCRIPTION: Places a green 52x47 rectangle at position (301, 147).
; PLAN: r0=301(x), r1=147(y), r2=52(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 147
LDI r2, 52
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
