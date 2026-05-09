; DESCRIPTION: Composite: Renders a blue box of size 98x77 starting at (408, 67) then Places a cyan dot at position (168, 74) then Draws a cyan line from (419, 131) to (6, 75).
; PLAN: r0=408(x), r1=67(y), r2=98(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=74(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=419(x1), r11=131(y1), r12=6(x2), r13=75(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 67
LDI r2, 98
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 74
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 419
LDI r11, 131
LDI r12, 6
LDI r13, 75
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
