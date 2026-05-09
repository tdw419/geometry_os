; DESCRIPTION: Creates a white rectangular region at (400, 38) spanning 65 by 103 pixels.
; PLAN: r0=400(x), r1=38(y), r2=65(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 38
LDI r2, 65
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
