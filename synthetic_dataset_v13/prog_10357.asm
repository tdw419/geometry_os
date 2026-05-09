; DESCRIPTION: Places a yellow 104x24 rectangle at position (233, 175).
; PLAN: r0=233(x), r1=175(y), r2=104(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 175
LDI r2, 104
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
