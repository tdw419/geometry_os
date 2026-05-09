; DESCRIPTION: Composite: Renders a blue line between points (276, 48) and (40, 146) then Renders a orange box of size 115x57 starting at (356, 129).
; PLAN: r0=276(x1), r1=48(y1), r2=40(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=129(y), r7=115(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 48
LDI r2, 40
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 129
LDI r7, 115
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
