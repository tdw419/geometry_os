; DESCRIPTION: Composite: Sets a single white pixel at (399, 50) then Renders a cyan box of size 89x95 starting at (130, 113) then Renders a cyan disk with center (447, 73) and radius 57.
; PLAN: r0=399(x), r1=50(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=113(y), r7=89(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=447(x), r11=73(y), r12=57(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 399
LDI r1, 50
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 113
LDI r7, 89
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 73
LDI r12, 57
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
