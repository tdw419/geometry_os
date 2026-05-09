; DESCRIPTION: Places a yellow 104x102 rectangle at position (160, 47).
; PLAN: r0=160(x), r1=47(y), r2=104(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 47
LDI r2, 104
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
