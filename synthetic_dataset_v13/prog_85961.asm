; DESCRIPTION: Composite: Places a blue circle of radius 73 at center (412, 87) then Renders a black box of size 95x54 starting at (24, 132).
; PLAN: r0=412(x), r1=87(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=132(y), r7=95(width), r8=54(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 87
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 132
LDI r7, 95
LDI r8, 54
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
