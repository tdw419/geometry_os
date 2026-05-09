; DESCRIPTION: Creates a white rectangular region at (214, 25) spanning 65 by 50 pixels.
; PLAN: r0=214(x), r1=25(y), r2=65(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 25
LDI r2, 65
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
