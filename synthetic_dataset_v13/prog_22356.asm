; DESCRIPTION: Composite: Sets a single white pixel at (144, 64) then Draws a orange line from (485, 150) to (294, 239).
; PLAN: r0=144(x), r1=64(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=485(x1), r6=150(y1), r7=294(x2), r8=239(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 64
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 485
LDI r6, 150
LDI r7, 294
LDI r8, 239
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
