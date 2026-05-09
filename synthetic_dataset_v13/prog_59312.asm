; DESCRIPTION: Composite: Sets a single green pixel at (246, 103) then Renders a yellow box of size 94x38 starting at (246, 97).
; PLAN: r0=246(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=97(y), r7=94(width), r8=38(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 246
LDI r6, 97
LDI r7, 94
LDI r8, 38
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
