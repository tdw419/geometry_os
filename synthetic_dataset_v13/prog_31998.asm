; DESCRIPTION: Composite: Renders a purple box of size 39x40 starting at (436, 39) then Places a magenta dot at position (453, 244).
; PLAN: r0=436(x), r1=39(y), r2=39(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x), r6=244(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 39
LDI r2, 39
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 244
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
