; DESCRIPTION: Composite: Renders a cyan line between points (101, 56) and (19, 170) then Places a green 48x17 rectangle at position (295, 88) then Places a blue dot at position (367, 101).
; PLAN: r0=101(x1), r1=56(y1), r2=19(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=88(y), r7=48(width), r8=17(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x), r11=101(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 101
LDI r1, 56
LDI r2, 19
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 88
LDI r7, 48
LDI r8, 17
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 101
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
