; DESCRIPTION: Creates a cyan rectangular region at (208, 20) spanning 30 by 68 pixels.
; PLAN: r0=208(x), r1=20(y), r2=30(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 20
LDI r2, 30
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
