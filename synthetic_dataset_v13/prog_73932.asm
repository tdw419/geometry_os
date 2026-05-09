; DESCRIPTION: Creates a orange rectangular region at (185, 59) spanning 95 by 15 pixels.
; PLAN: r0=185(x), r1=59(y), r2=95(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 59
LDI r2, 95
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
