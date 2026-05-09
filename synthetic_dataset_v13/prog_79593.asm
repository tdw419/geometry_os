; DESCRIPTION: Composite: Sets a single cyan pixel at (406, 46) then Renders a cyan box of size 53x66 starting at (227, 175).
; PLAN: r0=406(x), r1=46(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=175(y), r7=53(width), r8=66(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 46
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 175
LDI r7, 53
LDI r8, 66
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
