; DESCRIPTION: Places a orange 49x90 rectangle at position (169, 159).
; PLAN: r0=169(x), r1=159(y), r2=49(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 159
LDI r2, 49
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
