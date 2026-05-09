; DESCRIPTION: Creates a yellow rectangular region at (214, 101) spanning 111 by 82 pixels.
; PLAN: r0=214(x), r1=101(y), r2=111(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 101
LDI r2, 111
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
