; DESCRIPTION: Composite: Places a cyan circle of radius 14 at center (140, 47) then Creates a blue rectangular region at (206, 93) spanning 105 by 35 pixels.
; PLAN: r0=140(x), r1=47(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=93(y), r7=105(width), r8=35(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 47
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 93
LDI r7, 105
LDI r8, 35
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
