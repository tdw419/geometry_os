; DESCRIPTION: Creates a yellow rectangular region at (263, 152) spanning 25 by 104 pixels.
; PLAN: r0=263(x), r1=152(y), r2=25(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 152
LDI r2, 25
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
