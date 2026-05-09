; DESCRIPTION: Composite: Places a purple 80x34 rectangle at position (207, 93) then Places a cyan circle of radius 80 at center (198, 122).
; PLAN: r0=207(x), r1=93(y), r2=80(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=122(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 207
LDI r1, 93
LDI r2, 80
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 122
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
