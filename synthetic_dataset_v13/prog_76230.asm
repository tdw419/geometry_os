; DESCRIPTION: Creates a red rectangular region at (104, 129) spanning 113 by 99 pixels.
; PLAN: r0=104(x), r1=129(y), r2=113(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 129
LDI r2, 113
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
