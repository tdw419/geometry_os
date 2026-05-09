; DESCRIPTION: Creates a yellow rectangular region at (361, 47) spanning 59 by 27 pixels.
; PLAN: r0=361(x), r1=47(y), r2=59(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 47
LDI r2, 59
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
