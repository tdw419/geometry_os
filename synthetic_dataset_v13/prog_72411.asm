; DESCRIPTION: Composite: Sets a single white pixel at (144, 239) then Places a yellow line segment connecting (493, 196) to (390, 224).
; PLAN: r0=144(x), r1=239(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=196(y1), r7=390(x2), r8=224(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 239
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 493
LDI r6, 196
LDI r7, 390
LDI r8, 224
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
