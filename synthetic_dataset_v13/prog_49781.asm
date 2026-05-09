; DESCRIPTION: Creates a yellow rectangular region at (262, 189) spanning 99 by 57 pixels.
; PLAN: r0=262(x), r1=189(y), r2=99(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 189
LDI r2, 99
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
