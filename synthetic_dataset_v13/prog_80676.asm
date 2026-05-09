; DESCRIPTION: Composite: Renders a orange box of size 51x44 starting at (238, 139) then Places a red line segment connecting (488, 120) to (472, 151).
; PLAN: r0=238(x), r1=139(y), r2=51(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x1), r6=120(y1), r7=472(x2), r8=151(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 139
LDI r2, 51
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 120
LDI r7, 472
LDI r8, 151
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
