; DESCRIPTION: Composite: Draws a white line from (449, 82) to (36, 242) then Renders a blue box of size 86x98 starting at (164, 112).
; PLAN: r0=449(x1), r1=82(y1), r2=36(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=112(y), r7=86(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 82
LDI r2, 36
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 112
LDI r7, 86
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
