; DESCRIPTION: Composite: Renders a green box of size 30x101 starting at (433, 17) then Draws a black line from (345, 225) to (333, 253).
; PLAN: r0=433(x), r1=17(y), r2=30(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x1), r6=225(y1), r7=333(x2), r8=253(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 17
LDI r2, 30
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 225
LDI r7, 333
LDI r8, 253
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
