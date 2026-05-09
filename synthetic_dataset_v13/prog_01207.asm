; DESCRIPTION: Creates a red rectangular region at (102, 152) spanning 37 by 59 pixels.
; PLAN: r0=102(x), r1=152(y), r2=37(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 152
LDI r2, 37
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
