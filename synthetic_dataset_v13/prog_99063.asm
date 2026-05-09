; DESCRIPTION: Creates a white rectangular region at (272, 129) spanning 61 by 71 pixels.
; PLAN: r0=272(x), r1=129(y), r2=61(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 129
LDI r2, 61
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
