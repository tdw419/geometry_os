; DESCRIPTION: Creates a yellow rectangular region at (411, 152) spanning 60 by 50 pixels.
; PLAN: r0=411(x), r1=152(y), r2=60(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 152
LDI r2, 60
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
