; DESCRIPTION: Composite: Sets a single white pixel at (431, 144) then Draws a white line from (492, 130) to (256, 165).
; PLAN: r0=431(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=492(x1), r6=130(y1), r7=256(x2), r8=165(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 492
LDI r6, 130
LDI r7, 256
LDI r8, 165
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
