; DESCRIPTION: Creates a orange rectangular region at (246, 146) spanning 73 by 59 pixels.
; PLAN: r0=246(x), r1=146(y), r2=73(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 146
LDI r2, 73
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
