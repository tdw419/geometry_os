; DESCRIPTION: Composite: Places a orange line segment connecting (170, 235) to (173, 219) then Places a cyan 45x52 rectangle at position (241, 128).
; PLAN: r0=170(x1), r1=235(y1), r2=173(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=128(y), r7=45(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 235
LDI r2, 173
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 128
LDI r7, 45
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
