; DESCRIPTION: Creates a red rectangular region at (275, 55) spanning 51 by 60 pixels.
; PLAN: r0=275(x), r1=55(y), r2=51(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 55
LDI r2, 51
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
