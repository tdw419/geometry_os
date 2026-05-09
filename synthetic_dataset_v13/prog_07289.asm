; DESCRIPTION: Creates a cyan rectangular region at (85, 168) spanning 104 by 20 pixels.
; PLAN: r0=85(x), r1=168(y), r2=104(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 168
LDI r2, 104
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
