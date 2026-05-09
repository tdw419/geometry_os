; DESCRIPTION: Creates a red rectangular region at (46, 18) spanning 17 by 111 pixels.
; PLAN: r0=46(x), r1=18(y), r2=17(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 18
LDI r2, 17
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
