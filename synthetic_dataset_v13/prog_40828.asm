; DESCRIPTION: Composite: Draws a cyan line from (377, 66) to (397, 251) then Renders a purple box of size 36x73 starting at (410, 79).
; PLAN: r0=377(x1), r1=66(y1), r2=397(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=79(y), r7=36(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 66
LDI r2, 397
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 79
LDI r7, 36
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
