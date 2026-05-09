; DESCRIPTION: Composite: Draws a green line from (447, 221) to (254, 27) then Sets a single blue pixel at (275, 228).
; PLAN: r0=447(x1), r1=221(y1), r2=254(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=228(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 447
LDI r1, 221
LDI r2, 254
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 228
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
