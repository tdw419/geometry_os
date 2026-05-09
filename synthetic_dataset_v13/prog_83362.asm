; DESCRIPTION: Composite: Places a yellow 99x79 rectangle at position (108, 125) then Sets a single red pixel at (38, 243).
; PLAN: r0=108(x), r1=125(y), r2=99(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=243(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 125
LDI r2, 99
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 243
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
