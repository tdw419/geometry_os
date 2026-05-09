; DESCRIPTION: Composite: Draws a black line from (328, 40) to (101, 59) then Places a cyan circle of radius 62 at center (399, 92).
; PLAN: r0=328(x1), r1=40(y1), r2=101(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=92(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 40
LDI r2, 101
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 92
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
