; DESCRIPTION: Creates a green rectangular region at (113, 104) spanning 59 by 41 pixels.
; PLAN: r0=113(x), r1=104(y), r2=59(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 104
LDI r2, 59
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
