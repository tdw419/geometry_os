; DESCRIPTION: Places a yellow 104x78 rectangle at position (39, 78).
; PLAN: r0=39(x), r1=78(y), r2=104(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 78
LDI r2, 104
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
