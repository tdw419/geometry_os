; DESCRIPTION: Composite: Draws a blue line from (284, 119) to (79, 109) then Places a cyan dot at position (168, 174).
; PLAN: r0=284(x1), r1=119(y1), r2=79(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=174(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 284
LDI r1, 119
LDI r2, 79
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 174
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
