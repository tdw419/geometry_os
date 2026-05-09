; DESCRIPTION: Composite: Places a purple dot at position (482, 50) then Renders a cyan disk with center (324, 27) and radius 18 then Places a cyan 105x81 rectangle at position (133, 150).
; PLAN: r0=482(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=27(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=133(x), r11=150(y), r12=105(width), r13=81(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 27
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 133
LDI r11, 150
LDI r12, 105
LDI r13, 81
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
