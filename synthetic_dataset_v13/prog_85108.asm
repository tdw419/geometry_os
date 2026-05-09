; DESCRIPTION: Composite: Sets a single purple pixel at (503, 142) then Renders a black box of size 110x28 starting at (249, 180).
; PLAN: r0=503(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=180(y), r7=110(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 503
LDI r1, 142
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 180
LDI r7, 110
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
