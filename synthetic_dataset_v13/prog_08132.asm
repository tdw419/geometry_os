; DESCRIPTION: Creates a yellow rectangular region at (383, 132) spanning 42 by 117 pixels.
; PLAN: r0=383(x), r1=132(y), r2=42(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 132
LDI r2, 42
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
