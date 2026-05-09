; DESCRIPTION: Creates a purple rectangular region at (63, 129) spanning 70 by 104 pixels.
; PLAN: r0=63(x), r1=129(y), r2=70(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 129
LDI r2, 70
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
