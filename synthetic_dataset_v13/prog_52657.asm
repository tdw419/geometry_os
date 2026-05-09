; DESCRIPTION: Composite: Renders a purple box of size 29x100 starting at (82, 88) then Draws a cyan line from (494, 93) to (102, 26) then Sets a single white pixel at (211, 242).
; PLAN: r0=82(x), r1=88(y), r2=29(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x1), r6=93(y1), r7=102(x2), r8=26(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=211(x), r11=242(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 88
LDI r2, 29
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 93
LDI r7, 102
LDI r8, 26
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 242
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
