; DESCRIPTION: Creates a red rectangular region at (275, 184) spanning 113 by 33 pixels.
; PLAN: r0=275(x), r1=184(y), r2=113(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 184
LDI r2, 113
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
