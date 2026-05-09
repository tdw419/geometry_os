; DESCRIPTION: Creates a red rectangular region at (465, 113) spanning 32 by 107 pixels.
; PLAN: r0=465(x), r1=113(y), r2=32(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 113
LDI r2, 32
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
