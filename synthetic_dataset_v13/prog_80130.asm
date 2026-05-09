; DESCRIPTION: Creates a yellow rectangular region at (154, 46) spanning 28 by 95 pixels.
; PLAN: r0=154(x), r1=46(y), r2=28(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 46
LDI r2, 28
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
