; DESCRIPTION: Composite: Places a green line segment connecting (431, 100) to (418, 107) then Places a cyan 69x32 rectangle at position (355, 106).
; PLAN: r0=431(x1), r1=100(y1), r2=418(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=106(y), r7=69(width), r8=32(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 100
LDI r2, 418
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 106
LDI r7, 69
LDI r8, 32
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
