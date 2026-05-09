; DESCRIPTION: Composite: Creates a red rectangular region at (296, 26) spanning 48 by 91 pixels then Renders a red line between points (279, 224) and (298, 140) then Sets a single magenta pixel at (182, 42).
; PLAN: r0=296(x), r1=26(y), r2=48(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x1), r6=224(y1), r7=298(x2), r8=140(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=42(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 296
LDI r1, 26
LDI r2, 48
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 224
LDI r7, 298
LDI r8, 140
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 42
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
