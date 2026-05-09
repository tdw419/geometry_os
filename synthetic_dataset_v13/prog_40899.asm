; DESCRIPTION: Creates a orange rectangular region at (90, 45) spanning 68 by 107 pixels.
; PLAN: r0=90(x), r1=45(y), r2=68(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 45
LDI r2, 68
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
