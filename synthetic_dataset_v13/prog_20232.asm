; DESCRIPTION: Composite: Renders a orange box of size 102x24 starting at (277, 140) then Places a black line segment connecting (368, 182) to (69, 154).
; PLAN: r0=277(x), r1=140(y), r2=102(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x1), r6=182(y1), r7=69(x2), r8=154(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 140
LDI r2, 102
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 182
LDI r7, 69
LDI r8, 154
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
