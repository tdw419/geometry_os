; DESCRIPTION: Creates a magenta rectangular region at (398, 34) spanning 112 by 59 pixels.
; PLAN: r0=398(x), r1=34(y), r2=112(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 34
LDI r2, 112
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
