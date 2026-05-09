; DESCRIPTION: Creates a red rectangular region at (46, 60) spanning 59 by 33 pixels.
; PLAN: r0=46(x), r1=60(y), r2=59(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 60
LDI r2, 59
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
