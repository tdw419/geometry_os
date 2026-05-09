; DESCRIPTION: Composite: Renders a yellow box of size 115x75 starting at (162, 127) then Places a green dot at position (217, 222).
; PLAN: r0=162(x), r1=127(y), r2=115(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=222(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 162
LDI r1, 127
LDI r2, 115
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 222
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
