; DESCRIPTION: Creates a cyan rectangular region at (150, 74) spanning 95 by 41 pixels.
; PLAN: r0=150(x), r1=74(y), r2=95(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 74
LDI r2, 95
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
