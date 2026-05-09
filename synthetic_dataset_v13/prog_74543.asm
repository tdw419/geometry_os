; DESCRIPTION: Composite: Renders a green line between points (45, 103) and (412, 221) then Renders a blue box of size 49x31 starting at (116, 76).
; PLAN: r0=45(x1), r1=103(y1), r2=412(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=76(y), r7=49(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 103
LDI r2, 412
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 76
LDI r7, 49
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
