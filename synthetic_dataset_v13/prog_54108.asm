; DESCRIPTION: Composite: Renders a magenta line between points (269, 226) and (395, 228) then Places a red 70x86 rectangle at position (120, 83) then Sets a single yellow pixel at (481, 138).
; PLAN: r0=269(x1), r1=226(y1), r2=395(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=83(y), r7=70(width), r8=86(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=481(x), r11=138(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 269
LDI r1, 226
LDI r2, 395
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 83
LDI r7, 70
LDI r8, 86
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 138
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
