; DESCRIPTION: Creates a cyan rectangular region at (4, 59) spanning 41 by 19 pixels.
; PLAN: r0=4(x), r1=59(y), r2=41(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 59
LDI r2, 41
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
