; DESCRIPTION: Places a yellow 83x95 rectangle at position (222, 7).
; PLAN: r0=222(x), r1=7(y), r2=83(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 7
LDI r2, 83
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
