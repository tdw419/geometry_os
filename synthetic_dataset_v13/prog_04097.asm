; DESCRIPTION: Creates a cyan rectangular region at (373, 150) spanning 104 by 85 pixels.
; PLAN: r0=373(x), r1=150(y), r2=104(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 150
LDI r2, 104
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
