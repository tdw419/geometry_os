; DESCRIPTION: Creates a yellow rectangular region at (113, 146) spanning 99 by 50 pixels.
; PLAN: r0=113(x), r1=146(y), r2=99(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 146
LDI r2, 99
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
