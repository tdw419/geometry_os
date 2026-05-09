; DESCRIPTION: Places a yellow 74x54 rectangle at position (104, 173).
; PLAN: r0=104(x), r1=173(y), r2=74(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 173
LDI r2, 74
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
