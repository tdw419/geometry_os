; DESCRIPTION: Composite: Places a yellow 82x35 rectangle at position (360, 13) then Renders a cyan disk with center (178, 150) and radius 56 then Places a purple dot at position (365, 178).
; PLAN: r0=360(x), r1=13(y), r2=82(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=150(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x), r11=178(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 360
LDI r1, 13
LDI r2, 82
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 150
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 178
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
