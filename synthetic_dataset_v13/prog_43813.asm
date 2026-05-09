; DESCRIPTION: Composite: Places a cyan circle of radius 19 at center (86, 34) then Draws a cyan line from (131, 227) to (354, 182).
; PLAN: r0=86(x), r1=34(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x1), r6=227(y1), r7=354(x2), r8=182(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 34
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 227
LDI r7, 354
LDI r8, 182
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
