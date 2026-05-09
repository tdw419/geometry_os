; DESCRIPTION: Composite: Creates a purple rectangular region at (12, 33) spanning 99 by 95 pixels then Places a blue dot at position (277, 105).
; PLAN: r0=12(x), r1=33(y), r2=99(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=105(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 33
LDI r2, 99
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 105
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
