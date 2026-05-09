; DESCRIPTION: Creates a yellow rectangular region at (228, 62) spanning 77 by 113 pixels.
; PLAN: r0=228(x), r1=62(y), r2=77(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 62
LDI r2, 77
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
