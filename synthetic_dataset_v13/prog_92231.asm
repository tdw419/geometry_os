; DESCRIPTION: Creates a yellow rectangular region at (293, 45) spanning 109 by 111 pixels.
; PLAN: r0=293(x), r1=45(y), r2=109(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 45
LDI r2, 109
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
