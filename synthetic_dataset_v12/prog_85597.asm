; DESCRIPTION: Composite: Sets a single blue pixel at (198, 255) then Renders a white box of size 102x113 starting at (72, 96).
; PLAN: r0=198(x), r1=255(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=96(y), r7=102(width), r8=113(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 255
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 96
LDI r7, 102
LDI r8, 113
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
