; DESCRIPTION: Creates a white rectangular region at (39, 109) spanning 68 by 68 pixels.
; PLAN: r0=39(x), r1=109(y), r2=68(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 109
LDI r2, 68
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
