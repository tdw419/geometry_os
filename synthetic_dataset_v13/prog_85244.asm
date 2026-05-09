; DESCRIPTION: Composite: Places a magenta dot at position (391, 204) then Renders a red box of size 78x48 starting at (82, 191) then Places a magenta circle of radius 51 at center (407, 187).
; PLAN: r0=391(x), r1=204(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=191(y), r7=78(width), r8=48(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=407(x), r11=187(y), r12=51(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 204
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 82
LDI r6, 191
LDI r7, 78
LDI r8, 48
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 187
LDI r12, 51
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
