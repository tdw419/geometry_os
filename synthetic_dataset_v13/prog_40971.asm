; DESCRIPTION: Composite: Sets a single cyan pixel at (198, 43) then Renders a purple box of size 19x43 starting at (482, 132).
; PLAN: r0=198(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=482(x), r6=132(y), r7=19(width), r8=43(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 482
LDI r6, 132
LDI r7, 19
LDI r8, 43
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
