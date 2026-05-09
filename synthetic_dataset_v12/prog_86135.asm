; DESCRIPTION: Composite: Renders a black box of size 39x39 starting at (187, 125) then Places a white dot at position (283, 39).
; PLAN: r0=187(x), r1=125(y), r2=39(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=39(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 125
LDI r2, 39
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 39
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
