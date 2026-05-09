; DESCRIPTION: Creates a orange rectangular region at (180, 159) spanning 29 by 33 pixels.
; PLAN: r0=180(x), r1=159(y), r2=29(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 159
LDI r2, 29
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
