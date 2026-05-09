; DESCRIPTION: Creates a cyan rectangular region at (369, 152) spanning 15 by 96 pixels.
; PLAN: r0=369(x), r1=152(y), r2=15(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 152
LDI r2, 15
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
