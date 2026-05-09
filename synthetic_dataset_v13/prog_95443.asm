; DESCRIPTION: Creates a orange rectangular region at (465, 128) spanning 39 by 46 pixels.
; PLAN: r0=465(x), r1=128(y), r2=39(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 128
LDI r2, 39
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
