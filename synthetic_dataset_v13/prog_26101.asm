; DESCRIPTION: Composite: Renders a cyan box of size 24x11 starting at (301, 72) then Places a white dot at position (65, 102).
; PLAN: r0=301(x), r1=72(y), r2=24(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=102(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 72
LDI r2, 24
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 102
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
