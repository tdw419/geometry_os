; DESCRIPTION: Composite: Renders a red box of size 48x10 starting at (163, 32) then Draws a cyan line from (471, 129) to (501, 53).
; PLAN: r0=163(x), r1=32(y), r2=48(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x1), r6=129(y1), r7=501(x2), r8=53(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 32
LDI r2, 48
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 129
LDI r7, 501
LDI r8, 53
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
