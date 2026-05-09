; DESCRIPTION: Creates a orange rectangular region at (413, 166) spanning 58 by 64 pixels.
; PLAN: r0=413(x), r1=166(y), r2=58(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 166
LDI r2, 58
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
