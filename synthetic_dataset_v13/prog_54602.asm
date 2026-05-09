; DESCRIPTION: Composite: Places a white line segment connecting (441, 186) to (84, 235) then Places a cyan 40x103 rectangle at position (416, 36).
; PLAN: r0=441(x1), r1=186(y1), r2=84(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=36(y), r7=40(width), r8=103(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 186
LDI r2, 84
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 36
LDI r7, 40
LDI r8, 103
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
