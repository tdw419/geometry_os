; DESCRIPTION: Creates a yellow rectangular region at (387, 111) spanning 66 by 104 pixels.
; PLAN: r0=387(x), r1=111(y), r2=66(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 111
LDI r2, 66
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
