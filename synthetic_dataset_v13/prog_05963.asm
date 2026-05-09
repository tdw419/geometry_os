; DESCRIPTION: Creates a yellow rectangular region at (260, 7) spanning 24 by 95 pixels.
; PLAN: r0=260(x), r1=7(y), r2=24(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 7
LDI r2, 24
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
