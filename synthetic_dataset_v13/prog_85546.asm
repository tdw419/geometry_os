; DESCRIPTION: Creates a cyan rectangular region at (198, 129) spanning 85 by 47 pixels.
; PLAN: r0=198(x), r1=129(y), r2=85(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 129
LDI r2, 85
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
