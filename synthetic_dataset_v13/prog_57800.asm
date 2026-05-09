; DESCRIPTION: Composite: Renders a cyan box of size 94x39 starting at (243, 113) then Renders a red line between points (45, 210) and (5, 240) then Places a orange dot at position (131, 232).
; PLAN: r0=243(x), r1=113(y), r2=94(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x1), r6=210(y1), r7=5(x2), r8=240(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=232(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 243
LDI r1, 113
LDI r2, 94
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 210
LDI r7, 5
LDI r8, 240
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 232
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
