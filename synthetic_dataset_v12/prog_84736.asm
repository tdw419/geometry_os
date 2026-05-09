; DESCRIPTION: Creates a yellow rectangular region at (294, 174) spanning 77 by 53 pixels.
; PLAN: r0=294(x), r1=174(y), r2=77(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 174
LDI r2, 77
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
