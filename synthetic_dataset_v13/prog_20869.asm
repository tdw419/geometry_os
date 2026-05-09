; DESCRIPTION: Places a red 83x86 rectangle at position (227, 59).
; PLAN: r0=227(x), r1=59(y), r2=83(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 59
LDI r2, 83
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
