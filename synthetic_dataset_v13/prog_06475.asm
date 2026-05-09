; DESCRIPTION: Creates a cyan rectangular region at (288, 154) spanning 74 by 41 pixels.
; PLAN: r0=288(x), r1=154(y), r2=74(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 154
LDI r2, 74
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
