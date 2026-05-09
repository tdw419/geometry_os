; DESCRIPTION: Creates a blue rectangular region at (365, 129) spanning 56 by 104 pixels.
; PLAN: r0=365(x), r1=129(y), r2=56(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 129
LDI r2, 56
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
