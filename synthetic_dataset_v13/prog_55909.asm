; DESCRIPTION: Composite: Creates a orange rectangular region at (220, 12) spanning 111 by 106 pixels then Places a blue dot at position (103, 202).
; PLAN: r0=220(x), r1=12(y), r2=111(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=202(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 12
LDI r2, 111
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 202
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
