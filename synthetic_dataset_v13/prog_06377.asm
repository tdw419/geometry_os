; DESCRIPTION: Creates a cyan rectangular region at (422, 41) spanning 55 by 41 pixels.
; PLAN: r0=422(x), r1=41(y), r2=55(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 41
LDI r2, 55
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
