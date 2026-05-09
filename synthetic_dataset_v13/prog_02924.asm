; DESCRIPTION: Creates a cyan rectangular region at (253, 57) spanning 104 by 112 pixels.
; PLAN: r0=253(x), r1=57(y), r2=104(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 57
LDI r2, 104
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
