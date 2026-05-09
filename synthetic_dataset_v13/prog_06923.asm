; DESCRIPTION: Composite: Places a cyan 10x110 rectangle at position (198, 59) then Places a green circle of radius 19 at center (55, 96) then Places a purple dot at position (299, 57).
; PLAN: r0=198(x), r1=59(y), r2=10(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x), r6=96(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=299(x), r11=57(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 59
LDI r2, 10
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 96
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 299
LDI r11, 57
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
