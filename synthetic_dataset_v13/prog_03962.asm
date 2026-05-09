; DESCRIPTION: Composite: Renders a green disk with center (343, 143) and radius 51 then Renders a cyan box of size 109x113 starting at (217, 57).
; PLAN: r0=343(x), r1=143(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=57(y), r7=109(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 143
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 57
LDI r7, 109
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
