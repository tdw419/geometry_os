; DESCRIPTION: Places a orange 109x88 rectangle at position (391, 127).
; PLAN: r0=391(x), r1=127(y), r2=109(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 127
LDI r2, 109
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
