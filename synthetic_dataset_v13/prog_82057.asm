; DESCRIPTION: Composite: Draws a cyan circle centered at (140, 177) with radius 67 then Draws a black line from (383, 103) to (473, 208).
; PLAN: r0=140(x), r1=177(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x1), r6=103(y1), r7=473(x2), r8=208(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 177
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 103
LDI r7, 473
LDI r8, 208
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
