; DESCRIPTION: Places a orange 104x18 rectangle at position (304, 24).
; PLAN: r0=304(x), r1=24(y), r2=104(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 24
LDI r2, 104
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
