; DESCRIPTION: Creates a orange rectangular region at (362, 160) spanning 99 by 26 pixels.
; PLAN: r0=362(x), r1=160(y), r2=99(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 160
LDI r2, 99
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
