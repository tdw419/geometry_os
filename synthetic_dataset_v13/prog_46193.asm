; DESCRIPTION: Composite: Places a green dot at position (58, 162) then Renders a white box of size 17x12 starting at (460, 215).
; PLAN: r0=58(x), r1=162(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=460(x), r6=215(y), r7=17(width), r8=12(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 162
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 460
LDI r6, 215
LDI r7, 17
LDI r8, 12
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
