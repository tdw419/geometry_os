; DESCRIPTION: Creates a orange rectangular region at (7, 98) spanning 80 by 103 pixels.
; PLAN: r0=7(x), r1=98(y), r2=80(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 98
LDI r2, 80
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
