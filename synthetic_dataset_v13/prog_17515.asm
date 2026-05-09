; DESCRIPTION: Places a magenta 96x41 rectangle at position (5, 7).
; PLAN: r0=5(x), r1=7(y), r2=96(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 7
LDI r2, 96
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
