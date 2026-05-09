; DESCRIPTION: Composite: Creates a white rectangular region at (193, 133) spanning 14 by 77 pixels then Draws a cyan circle centered at (243, 127) with radius 66.
; PLAN: r0=193(x), r1=133(y), r2=14(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=127(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 193
LDI r1, 133
LDI r2, 14
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 127
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
