; DESCRIPTION: Creates a red rectangular region at (253, 152) spanning 37 by 41 pixels.
; PLAN: r0=253(x), r1=152(y), r2=37(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 152
LDI r2, 37
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
