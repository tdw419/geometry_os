; DESCRIPTION: Composite: Places a magenta dot at position (340, 31) then Places a yellow line segment connecting (209, 109) to (353, 234).
; PLAN: r0=340(x), r1=31(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=209(x1), r6=109(y1), r7=353(x2), r8=234(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 31
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 109
LDI r7, 353
LDI r8, 234
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
