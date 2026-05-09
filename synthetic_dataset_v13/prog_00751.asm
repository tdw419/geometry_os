; DESCRIPTION: Composite: Draws a red line from (480, 181) to (111, 234) then Sets a single cyan pixel at (61, 123).
; PLAN: r0=480(x1), r1=181(y1), r2=111(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=123(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 480
LDI r1, 181
LDI r2, 111
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 123
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
