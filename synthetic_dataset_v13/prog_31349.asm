; DESCRIPTION: Creates a yellow rectangular region at (57, 211) spanning 82 by 27 pixels.
; PLAN: r0=57(x), r1=211(y), r2=82(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 211
LDI r2, 82
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
