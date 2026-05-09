; DESCRIPTION: Creates a white rectangular region at (126, 59) spanning 109 by 25 pixels.
; PLAN: r0=126(x), r1=59(y), r2=109(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 59
LDI r2, 109
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
