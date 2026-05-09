; DESCRIPTION: Composite: Places a blue 61x53 rectangle at position (229, 32) then Places a black line segment connecting (138, 15) to (264, 242).
; PLAN: r0=229(x), r1=32(y), r2=61(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x1), r6=15(y1), r7=264(x2), r8=242(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 32
LDI r2, 61
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 15
LDI r7, 264
LDI r8, 242
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
