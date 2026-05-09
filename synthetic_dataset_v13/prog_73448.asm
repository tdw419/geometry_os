; DESCRIPTION: Creates a orange rectangular region at (412, 127) spanning 69 by 12 pixels.
; PLAN: r0=412(x), r1=127(y), r2=69(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 127
LDI r2, 69
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
