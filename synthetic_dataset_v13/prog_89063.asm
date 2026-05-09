; DESCRIPTION: Composite: Renders a blue box of size 109x110 starting at (162, 134) then Places a orange dot at position (450, 221).
; PLAN: r0=162(x), r1=134(y), r2=109(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x), r6=221(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 162
LDI r1, 134
LDI r2, 109
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 221
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
