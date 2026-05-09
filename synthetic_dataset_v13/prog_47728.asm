; DESCRIPTION: Composite: Sets a single white pixel at (296, 20) then Renders a black box of size 84x82 starting at (408, 95).
; PLAN: r0=296(x), r1=20(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=95(y), r7=84(width), r8=82(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 20
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 95
LDI r7, 84
LDI r8, 82
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
