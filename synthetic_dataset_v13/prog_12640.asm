; DESCRIPTION: Creates a orange rectangular region at (362, 74) spanning 58 by 76 pixels.
; PLAN: r0=362(x), r1=74(y), r2=58(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 74
LDI r2, 58
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
