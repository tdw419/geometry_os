; DESCRIPTION: Composite: Places a black line segment connecting (484, 123) to (126, 90) then Places a cyan 88x61 rectangle at position (371, 125).
; PLAN: r0=484(x1), r1=123(y1), r2=126(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=125(y), r7=88(width), r8=61(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 123
LDI r2, 126
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 125
LDI r7, 88
LDI r8, 61
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
