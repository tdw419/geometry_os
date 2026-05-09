; DESCRIPTION: Composite: Draws a blue line from (42, 76) to (202, 20) then Places a magenta dot at position (392, 204).
; PLAN: r0=42(x1), r1=76(y1), r2=202(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=204(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 76
LDI r2, 202
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 204
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
