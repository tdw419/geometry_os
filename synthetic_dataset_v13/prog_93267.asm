; DESCRIPTION: Places a yellow 104x67 rectangle at position (120, 144).
; PLAN: r0=120(x), r1=144(y), r2=104(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 144
LDI r2, 104
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
