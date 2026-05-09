; DESCRIPTION: Creates a yellow rectangular region at (446, 171) spanning 41 by 67 pixels.
; PLAN: r0=446(x), r1=171(y), r2=41(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 171
LDI r2, 41
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
