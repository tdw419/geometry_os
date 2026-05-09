; DESCRIPTION: Composite: Renders a purple box of size 60x61 starting at (200, 187) then Draws a green line from (509, 143) to (209, 194).
; PLAN: r0=200(x), r1=187(y), r2=60(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x1), r6=143(y1), r7=209(x2), r8=194(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 187
LDI r2, 60
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 143
LDI r7, 209
LDI r8, 194
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
