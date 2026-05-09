; DESCRIPTION: Creates a green rectangular region at (103, 129) spanning 108 by 94 pixels.
; PLAN: r0=103(x), r1=129(y), r2=108(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 129
LDI r2, 108
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
