; DESCRIPTION: Creates a orange rectangular region at (368, 106) spanning 28 by 11 pixels.
; PLAN: r0=368(x), r1=106(y), r2=28(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 106
LDI r2, 28
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
