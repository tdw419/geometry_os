; DESCRIPTION: Creates a orange rectangular region at (140, 180) spanning 45 by 73 pixels.
; PLAN: r0=140(x), r1=180(y), r2=45(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 180
LDI r2, 45
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
