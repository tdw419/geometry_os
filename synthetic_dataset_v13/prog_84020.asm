; DESCRIPTION: Composite: Places a black 87x92 rectangle at position (279, 99) then Places a black line segment connecting (450, 196) to (127, 142).
; PLAN: r0=279(x), r1=99(y), r2=87(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x1), r6=196(y1), r7=127(x2), r8=142(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 99
LDI r2, 87
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 196
LDI r7, 127
LDI r8, 142
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
