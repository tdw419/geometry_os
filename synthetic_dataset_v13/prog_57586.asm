; DESCRIPTION: Creates a black rectangular region at (290, 71) spanning 111 by 86 pixels.
; PLAN: r0=290(x), r1=71(y), r2=111(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 71
LDI r2, 111
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
