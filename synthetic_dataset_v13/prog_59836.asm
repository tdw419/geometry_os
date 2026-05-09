; DESCRIPTION: Creates a white rectangular region at (368, 2) spanning 10 by 50 pixels.
; PLAN: r0=368(x), r1=2(y), r2=10(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 2
LDI r2, 10
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
