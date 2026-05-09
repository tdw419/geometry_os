; DESCRIPTION: Creates a orange rectangular region at (311, 133) spanning 103 by 70 pixels.
; PLAN: r0=311(x), r1=133(y), r2=103(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 133
LDI r2, 103
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
