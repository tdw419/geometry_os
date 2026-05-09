; DESCRIPTION: Composite: Renders a white box of size 38x71 starting at (371, 6) then Places a green line segment connecting (504, 25) to (461, 61).
; PLAN: r0=371(x), r1=6(y), r2=38(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x1), r6=25(y1), r7=461(x2), r8=61(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 6
LDI r2, 38
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 25
LDI r7, 461
LDI r8, 61
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
