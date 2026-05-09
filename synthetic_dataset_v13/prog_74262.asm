; DESCRIPTION: Creates a cyan rectangular region at (420, 12) spanning 47 by 104 pixels.
; PLAN: r0=420(x), r1=12(y), r2=47(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 12
LDI r2, 47
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
