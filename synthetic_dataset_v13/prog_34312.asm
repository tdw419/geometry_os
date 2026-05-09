; DESCRIPTION: Composite: Renders a magenta box of size 26x68 starting at (215, 83) then Places a white dot at position (394, 166).
; PLAN: r0=215(x), r1=83(y), r2=26(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=166(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 215
LDI r1, 83
LDI r2, 26
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 166
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
