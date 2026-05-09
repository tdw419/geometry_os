; DESCRIPTION: Composite: Places a cyan circle of radius 59 at center (178, 94) then Draws a white line from (477, 116) to (280, 126).
; PLAN: r0=178(x), r1=94(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x1), r6=116(y1), r7=280(x2), r8=126(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 94
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 116
LDI r7, 280
LDI r8, 126
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
