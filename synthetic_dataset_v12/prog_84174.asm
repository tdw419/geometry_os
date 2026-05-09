; DESCRIPTION: Composite: Creates a white rectangular region at (38, 57) spanning 33 by 16 pixels then Places a cyan dot at position (135, 54).
; PLAN: r0=38(x), r1=57(y), r2=33(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=135(x), r6=54(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 38
LDI r1, 57
LDI r2, 33
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 54
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
