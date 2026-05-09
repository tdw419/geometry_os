; DESCRIPTION: Places a orange 10x54 rectangle at position (75, 15).
; PLAN: r0=75(x), r1=15(y), r2=10(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 15
LDI r2, 10
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
