; DESCRIPTION: Composite: Renders a purple box of size 85x116 starting at (352, 64) then Places a orange dot at position (173, 130).
; PLAN: r0=352(x), r1=64(y), r2=85(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x), r6=130(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 64
LDI r2, 85
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 130
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
