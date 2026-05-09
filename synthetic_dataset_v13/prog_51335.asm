; DESCRIPTION: Creates a orange rectangular region at (287, 179) spanning 90 by 15 pixels.
; PLAN: r0=287(x), r1=179(y), r2=90(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 179
LDI r2, 90
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
