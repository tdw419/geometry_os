; DESCRIPTION: Creates a red rectangular region at (140, 129) spanning 28 by 25 pixels.
; PLAN: r0=140(x), r1=129(y), r2=28(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 129
LDI r2, 28
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
