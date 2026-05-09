; DESCRIPTION: Composite: Places a black line segment connecting (260, 196) to (311, 10) then Places a cyan 68x70 rectangle at position (168, 105).
; PLAN: r0=260(x1), r1=196(y1), r2=311(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=105(y), r7=68(width), r8=70(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 196
LDI r2, 311
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 105
LDI r7, 68
LDI r8, 70
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
