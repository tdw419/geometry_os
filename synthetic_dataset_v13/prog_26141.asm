; DESCRIPTION: Creates a red rectangular region at (177, 4) spanning 104 by 86 pixels.
; PLAN: r0=177(x), r1=4(y), r2=104(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 4
LDI r2, 104
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
