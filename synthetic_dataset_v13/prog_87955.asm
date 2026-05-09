; DESCRIPTION: Composite: Draws a cyan line from (54, 212) to (367, 47) then Draws a red circle centered at (108, 119) with radius 73.
; PLAN: r0=54(x1), r1=212(y1), r2=367(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=119(y), r7=73(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 212
LDI r2, 367
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 119
LDI r7, 73
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
