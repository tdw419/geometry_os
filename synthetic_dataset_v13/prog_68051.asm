; DESCRIPTION: Composite: Places a blue 42x41 rectangle at position (159, 203) then Renders a cyan line between points (330, 243) and (307, 232) then Sets a single green pixel at (48, 230).
; PLAN: r0=159(x), r1=203(y), r2=42(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x1), r6=243(y1), r7=307(x2), r8=232(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=48(x), r11=230(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 203
LDI r2, 42
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 243
LDI r7, 307
LDI r8, 232
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 48
LDI r11, 230
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
