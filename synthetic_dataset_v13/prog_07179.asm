; DESCRIPTION: Places a yellow 120x75 rectangle at position (104, 62).
; PLAN: r0=104(x), r1=62(y), r2=120(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 62
LDI r2, 120
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
