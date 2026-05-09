; DESCRIPTION: Creates a yellow rectangular region at (298, 59) spanning 113 by 112 pixels.
; PLAN: r0=298(x), r1=59(y), r2=113(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 59
LDI r2, 113
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
