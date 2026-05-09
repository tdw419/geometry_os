; DESCRIPTION: Composite: Places a cyan 106x48 rectangle at position (67, 68) then Renders a orange disk with center (144, 217) and radius 36 then Sets a single green pixel at (333, 27).
; PLAN: r0=67(x), r1=68(y), r2=106(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=217(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x), r11=27(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 67
LDI r1, 68
LDI r2, 106
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 217
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 27
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
