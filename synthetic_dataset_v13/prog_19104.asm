; DESCRIPTION: Places a yellow 83x59 rectangle at position (244, 104).
; PLAN: r0=244(x), r1=104(y), r2=83(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 104
LDI r2, 83
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
