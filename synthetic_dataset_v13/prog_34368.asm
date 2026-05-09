; DESCRIPTION: Creates a yellow rectangular region at (213, 57) spanning 46 by 120 pixels.
; PLAN: r0=213(x), r1=57(y), r2=46(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 57
LDI r2, 46
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
