; DESCRIPTION: Creates a cyan rectangular region at (292, 10) spanning 50 by 68 pixels.
; PLAN: r0=292(x), r1=10(y), r2=50(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 10
LDI r2, 50
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
