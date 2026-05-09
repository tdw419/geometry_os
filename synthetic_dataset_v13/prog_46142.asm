; DESCRIPTION: Composite: Renders a white box of size 62x26 starting at (61, 124) then Renders a magenta line between points (306, 115) and (410, 115) then Sets a single white pixel at (168, 103).
; PLAN: r0=61(x), r1=124(y), r2=62(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x1), r6=115(y1), r7=410(x2), r8=115(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=168(x), r11=103(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 124
LDI r2, 62
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 115
LDI r7, 410
LDI r8, 115
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 103
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
