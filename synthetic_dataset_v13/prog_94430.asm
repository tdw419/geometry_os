; DESCRIPTION: Places a orange 80x45 rectangle at position (278, 18).
; PLAN: r0=278(x), r1=18(y), r2=80(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 18
LDI r2, 80
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
