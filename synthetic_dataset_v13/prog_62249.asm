; DESCRIPTION: Places a orange 52x104 rectangle at position (259, 59).
; PLAN: r0=259(x), r1=59(y), r2=52(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 59
LDI r2, 52
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
