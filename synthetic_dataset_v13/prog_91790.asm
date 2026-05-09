; DESCRIPTION: Composite: Renders a red box of size 92x57 starting at (224, 109) then Places a yellow line segment connecting (161, 77) to (143, 17).
; PLAN: r0=224(x), r1=109(y), r2=92(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x1), r6=77(y1), r7=143(x2), r8=17(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 109
LDI r2, 92
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 77
LDI r7, 143
LDI r8, 17
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
