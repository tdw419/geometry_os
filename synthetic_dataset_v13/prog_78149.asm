; DESCRIPTION: Creates a red rectangular region at (82, 129) spanning 84 by 80 pixels.
; PLAN: r0=82(x), r1=129(y), r2=84(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 129
LDI r2, 84
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
