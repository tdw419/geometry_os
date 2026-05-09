; DESCRIPTION: Creates a yellow rectangular region at (374, 179) spanning 104 by 65 pixels.
; PLAN: r0=374(x), r1=179(y), r2=104(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 179
LDI r2, 104
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
