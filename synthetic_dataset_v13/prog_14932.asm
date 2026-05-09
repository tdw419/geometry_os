; DESCRIPTION: Composite: Renders a purple box of size 118x50 starting at (206, 13) then Sets a single cyan pixel at (123, 155).
; PLAN: r0=206(x), r1=13(y), r2=118(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=155(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 206
LDI r1, 13
LDI r2, 118
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 155
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
