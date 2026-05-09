; DESCRIPTION: Places a orange 104x30 rectangle at position (25, 196).
; PLAN: r0=25(x), r1=196(y), r2=104(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 196
LDI r2, 104
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
