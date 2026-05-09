; DESCRIPTION: Creates a orange rectangular region at (211, 177) spanning 12 by 74 pixels.
; PLAN: r0=211(x), r1=177(y), r2=12(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 177
LDI r2, 12
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
