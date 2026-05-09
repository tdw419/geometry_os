; DESCRIPTION: Composite: Renders a red box of size 16x57 starting at (38, 193) then Renders a black line between points (9, 146) and (244, 249).
; PLAN: r0=38(x), r1=193(y), r2=16(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x1), r6=146(y1), r7=244(x2), r8=249(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 193
LDI r2, 16
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 146
LDI r7, 244
LDI r8, 249
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
