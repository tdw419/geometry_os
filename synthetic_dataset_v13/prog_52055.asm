; DESCRIPTION: Creates a orange rectangular region at (226, 195) spanning 10 by 12 pixels.
; PLAN: r0=226(x), r1=195(y), r2=10(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 195
LDI r2, 10
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
