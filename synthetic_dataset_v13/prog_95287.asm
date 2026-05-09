; DESCRIPTION: Creates a orange rectangular region at (271, 167) spanning 120 by 46 pixels.
; PLAN: r0=271(x), r1=167(y), r2=120(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 167
LDI r2, 120
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
