; DESCRIPTION: Composite: Places a orange dot at position (491, 154) then Draws a blue line from (84, 173) to (213, 163).
; PLAN: r0=491(x), r1=154(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=84(x1), r6=173(y1), r7=213(x2), r8=163(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 154
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 84
LDI r6, 173
LDI r7, 213
LDI r8, 163
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
