; DESCRIPTION: Composite: Renders a yellow line between points (443, 28) and (60, 74) then Renders a yellow box of size 62x69 starting at (419, 33) then Sets a single white pixel at (124, 197).
; PLAN: r0=443(x1), r1=28(y1), r2=60(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=33(y), r7=62(width), r8=69(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=124(x), r11=197(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 443
LDI r1, 28
LDI r2, 60
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 33
LDI r7, 62
LDI r8, 69
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 197
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
