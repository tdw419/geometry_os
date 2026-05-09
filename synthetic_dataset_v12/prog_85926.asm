; DESCRIPTION: Composite: Draws a cyan line from (13, 226) to (48, 38) then Creates a red circular shape at (119, 146) with radius 41.
; PLAN: r0=13(x1), r1=226(y1), r2=48(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=146(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 226
LDI r2, 48
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 146
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
