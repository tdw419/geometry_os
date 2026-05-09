; DESCRIPTION: Creates a orange rectangular region at (387, 37) spanning 59 by 73 pixels.
; PLAN: r0=387(x), r1=37(y), r2=59(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 37
LDI r2, 59
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
