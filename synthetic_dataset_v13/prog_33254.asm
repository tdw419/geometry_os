; DESCRIPTION: Creates a purple rectangular region at (198, 129) spanning 116 by 83 pixels.
; PLAN: r0=198(x), r1=129(y), r2=116(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 129
LDI r2, 116
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
