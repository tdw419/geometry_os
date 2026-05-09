; DESCRIPTION: Composite: Draws a cyan line from (123, 213) to (50, 74) then Sets a single purple pixel at (200, 136).
; PLAN: r0=123(x1), r1=213(y1), r2=50(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=136(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 123
LDI r1, 213
LDI r2, 50
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 136
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
