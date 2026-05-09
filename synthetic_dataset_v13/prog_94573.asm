; DESCRIPTION: Creates a orange rectangular region at (340, 91) spanning 59 by 116 pixels.
; PLAN: r0=340(x), r1=91(y), r2=59(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 91
LDI r2, 59
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
