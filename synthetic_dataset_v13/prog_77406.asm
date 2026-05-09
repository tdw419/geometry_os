; DESCRIPTION: Composite: Renders a red line between points (229, 181) and (244, 80) then Renders a yellow box of size 35x64 starting at (456, 107).
; PLAN: r0=229(x1), r1=181(y1), r2=244(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=107(y), r7=35(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 181
LDI r2, 244
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 107
LDI r7, 35
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
