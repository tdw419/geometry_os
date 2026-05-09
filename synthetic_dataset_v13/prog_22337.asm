; DESCRIPTION: Creates a orange rectangular region at (79, 47) spanning 72 by 94 pixels.
; PLAN: r0=79(x), r1=47(y), r2=72(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 47
LDI r2, 72
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
