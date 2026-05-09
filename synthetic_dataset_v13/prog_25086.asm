; DESCRIPTION: Places a green 91x101 rectangle at position (301, 59).
; PLAN: r0=301(x), r1=59(y), r2=91(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 59
LDI r2, 91
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
