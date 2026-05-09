; DESCRIPTION: Creates a white rectangular region at (346, 91) spanning 36 by 109 pixels.
; PLAN: r0=346(x), r1=91(y), r2=36(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 91
LDI r2, 36
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
