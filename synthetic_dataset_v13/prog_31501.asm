; DESCRIPTION: Creates a yellow rectangular region at (208, 116) spanning 27 by 111 pixels.
; PLAN: r0=208(x), r1=116(y), r2=27(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 116
LDI r2, 27
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
