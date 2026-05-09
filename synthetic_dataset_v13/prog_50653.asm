; DESCRIPTION: Composite: Places a red dot at position (52, 246) then Renders a purple box of size 109x109 starting at (32, 142).
; PLAN: r0=52(x), r1=246(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=142(y), r7=109(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 246
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 32
LDI r6, 142
LDI r7, 109
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
