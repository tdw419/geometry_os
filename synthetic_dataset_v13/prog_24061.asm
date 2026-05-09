; DESCRIPTION: Composite: Renders a cyan disk with center (33, 162) and radius 20 then Places a purple dot at position (349, 83) then Renders a green box of size 76x34 starting at (297, 135).
; PLAN: r0=33(x), r1=162(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=83(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=297(x), r11=135(y), r12=76(width), r13=34(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 162
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 83
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 297
LDI r11, 135
LDI r12, 76
LDI r13, 34
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
