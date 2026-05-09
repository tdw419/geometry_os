; DESCRIPTION: Creates a orange rectangular region at (307, 132) spanning 39 by 103 pixels.
; PLAN: r0=307(x), r1=132(y), r2=39(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 132
LDI r2, 39
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
