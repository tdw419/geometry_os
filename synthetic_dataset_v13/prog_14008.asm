; DESCRIPTION: Composite: Draws a red line from (101, 228) to (485, 117) then Places a yellow dot at position (236, 16).
; PLAN: r0=101(x1), r1=228(y1), r2=485(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=16(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 101
LDI r1, 228
LDI r2, 485
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 16
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
