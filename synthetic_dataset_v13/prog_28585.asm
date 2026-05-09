; DESCRIPTION: Composite: Renders a cyan box of size 27x70 starting at (50, 97) then Renders a green line between points (155, 213) and (42, 158).
; PLAN: r0=50(x), r1=97(y), r2=27(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x1), r6=213(y1), r7=42(x2), r8=158(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 97
LDI r2, 27
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 213
LDI r7, 42
LDI r8, 158
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
