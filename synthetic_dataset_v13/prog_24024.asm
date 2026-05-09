; DESCRIPTION: Creates a orange rectangular region at (177, 33) spanning 32 by 112 pixels.
; PLAN: r0=177(x), r1=33(y), r2=32(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 33
LDI r2, 32
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
