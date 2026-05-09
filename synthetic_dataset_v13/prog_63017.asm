; DESCRIPTION: Creates a orange rectangular region at (66, 129) spanning 94 by 30 pixels.
; PLAN: r0=66(x), r1=129(y), r2=94(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 129
LDI r2, 94
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
