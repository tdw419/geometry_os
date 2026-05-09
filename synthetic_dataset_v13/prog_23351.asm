; DESCRIPTION: Composite: Renders a blue box of size 28x26 starting at (177, 187) then Places a purple dot at position (135, 124).
; PLAN: r0=177(x), r1=187(y), r2=28(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=135(x), r6=124(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 187
LDI r2, 28
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 124
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
