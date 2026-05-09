; DESCRIPTION: Creates a white rectangular region at (284, 189) spanning 31 by 26 pixels.
; PLAN: r0=284(x), r1=189(y), r2=31(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 189
LDI r2, 31
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
