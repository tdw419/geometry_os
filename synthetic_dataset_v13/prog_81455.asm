; DESCRIPTION: Creates a orange rectangular region at (368, 113) spanning 16 by 40 pixels.
; PLAN: r0=368(x), r1=113(y), r2=16(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 113
LDI r2, 16
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
