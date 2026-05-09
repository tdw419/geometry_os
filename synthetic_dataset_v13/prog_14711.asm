; DESCRIPTION: Creates a orange rectangular region at (393, 73) spanning 96 by 27 pixels.
; PLAN: r0=393(x), r1=73(y), r2=96(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 73
LDI r2, 96
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
