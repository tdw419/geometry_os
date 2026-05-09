; DESCRIPTION: Composite: Places a magenta 40x21 rectangle at position (100, 146) then Places a purple dot at position (353, 167).
; PLAN: r0=100(x), r1=146(y), r2=40(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=167(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 146
LDI r2, 40
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 167
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
