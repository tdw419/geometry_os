; DESCRIPTION: Creates a yellow rectangular region at (333, 129) spanning 107 by 27 pixels.
; PLAN: r0=333(x), r1=129(y), r2=107(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 129
LDI r2, 107
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
