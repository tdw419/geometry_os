; DESCRIPTION: Composite: Sets a single orange pixel at (401, 113) then Draws a blue line from (474, 184) to (361, 125).
; PLAN: r0=401(x), r1=113(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=474(x1), r6=184(y1), r7=361(x2), r8=125(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 113
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 474
LDI r6, 184
LDI r7, 361
LDI r8, 125
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
