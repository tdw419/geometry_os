; DESCRIPTION: Creates a yellow rectangular region at (121, 150) spanning 54 by 57 pixels.
; PLAN: r0=121(x), r1=150(y), r2=54(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 150
LDI r2, 54
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
