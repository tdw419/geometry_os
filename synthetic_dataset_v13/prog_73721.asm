; DESCRIPTION: Composite: Renders a red box of size 48x53 starting at (110, 51) then Places a cyan line segment connecting (66, 53) to (155, 243).
; PLAN: r0=110(x), r1=51(y), r2=48(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x1), r6=53(y1), r7=155(x2), r8=243(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 51
LDI r2, 48
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 53
LDI r7, 155
LDI r8, 243
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
