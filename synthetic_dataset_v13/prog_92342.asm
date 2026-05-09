; DESCRIPTION: Composite: Sets a single magenta pixel at (496, 247) then Places a green line segment connecting (298, 5) to (455, 21) then Places a cyan 94x99 rectangle at position (342, 89).
; PLAN: r0=496(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=298(x1), r6=5(y1), r7=455(x2), r8=21(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=89(y), r12=94(width), r13=99(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 496
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 298
LDI r6, 5
LDI r7, 455
LDI r8, 21
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 89
LDI r12, 94
LDI r13, 99
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
