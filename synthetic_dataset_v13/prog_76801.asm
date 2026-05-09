; DESCRIPTION: Composite: Renders a red box of size 56x67 starting at (323, 115) then Places a cyan line segment connecting (347, 131) to (74, 154).
; PLAN: r0=323(x), r1=115(y), r2=56(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x1), r6=131(y1), r7=74(x2), r8=154(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 115
LDI r2, 56
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 131
LDI r7, 74
LDI r8, 154
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
