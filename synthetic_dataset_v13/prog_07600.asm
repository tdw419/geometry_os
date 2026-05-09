; DESCRIPTION: Creates a yellow rectangular region at (408, 152) spanning 54 by 96 pixels.
; PLAN: r0=408(x), r1=152(y), r2=54(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 152
LDI r2, 54
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
