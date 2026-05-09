; DESCRIPTION: Composite: Draws a cyan line from (180, 215) to (182, 179) then Places a magenta dot at position (449, 122).
; PLAN: r0=180(x1), r1=215(y1), r2=182(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=122(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 215
LDI r2, 182
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 122
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
