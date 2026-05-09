; DESCRIPTION: Creates a orange rectangular region at (305, 114) spanning 33 by 92 pixels.
; PLAN: r0=305(x), r1=114(y), r2=33(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 114
LDI r2, 33
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
