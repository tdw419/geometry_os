; DESCRIPTION: Creates a white rectangular region at (313, 69) spanning 106 by 113 pixels.
; PLAN: r0=313(x), r1=69(y), r2=106(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 69
LDI r2, 106
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
