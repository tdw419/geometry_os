; DESCRIPTION: Places a yellow 104x29 rectangle at position (40, 82).
; PLAN: r0=40(x), r1=82(y), r2=104(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 82
LDI r2, 104
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
