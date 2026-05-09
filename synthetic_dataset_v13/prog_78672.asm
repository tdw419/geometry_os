; DESCRIPTION: Composite: Places a cyan circle of radius 42 at center (245, 57) then Places a yellow line segment connecting (373, 217) to (281, 112).
; PLAN: r0=245(x), r1=57(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x1), r6=217(y1), r7=281(x2), r8=112(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 245
LDI r1, 57
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 217
LDI r7, 281
LDI r8, 112
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
