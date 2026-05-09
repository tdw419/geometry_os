; DESCRIPTION: Composite: Sets a single purple pixel at (240, 149) then Renders a black line between points (187, 31) and (213, 216) then Places a cyan 35x48 rectangle at position (317, 99).
; PLAN: r0=240(x), r1=149(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=187(x1), r6=31(y1), r7=213(x2), r8=216(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=317(x), r11=99(y), r12=35(width), r13=48(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 149
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 31
LDI r7, 213
LDI r8, 216
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 99
LDI r12, 35
LDI r13, 48
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
