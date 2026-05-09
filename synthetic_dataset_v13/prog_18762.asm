; DESCRIPTION: Composite: Places a cyan circle of radius 39 at center (423, 117) then Creates a blue rectangular region at (455, 47) spanning 17 by 40 pixels.
; PLAN: r0=423(x), r1=117(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=47(y), r7=17(width), r8=40(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 117
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 47
LDI r7, 17
LDI r8, 40
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
