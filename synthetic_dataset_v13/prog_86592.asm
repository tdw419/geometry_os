; DESCRIPTION: Composite: Creates a cyan rectangular region at (172, 67) spanning 99 by 40 pixels then Places a white dot at position (403, 180).
; PLAN: r0=172(x), r1=67(y), r2=99(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=180(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 67
LDI r2, 99
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 180
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
