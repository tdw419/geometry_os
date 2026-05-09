; DESCRIPTION: Creates a red rectangular region at (435, 97) spanning 77 by 50 pixels.
; PLAN: r0=435(x), r1=97(y), r2=77(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 97
LDI r2, 77
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
