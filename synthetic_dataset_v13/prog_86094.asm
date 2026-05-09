; DESCRIPTION: Composite: Renders a black box of size 67x116 starting at (94, 131) then Places a cyan line segment connecting (412, 66) to (8, 253).
; PLAN: r0=94(x), r1=131(y), r2=67(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x1), r6=66(y1), r7=8(x2), r8=253(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 131
LDI r2, 67
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 66
LDI r7, 8
LDI r8, 253
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
