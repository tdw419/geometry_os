; DESCRIPTION: Places a red 58x87 rectangle at position (301, 54).
; PLAN: r0=301(x), r1=54(y), r2=58(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 54
LDI r2, 58
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
