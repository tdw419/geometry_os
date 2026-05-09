; DESCRIPTION: Composite: Places a cyan dot at position (323, 130) then Renders a green box of size 117x112 starting at (91, 20).
; PLAN: r0=323(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=20(y), r7=117(width), r8=112(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 91
LDI r6, 20
LDI r7, 117
LDI r8, 112
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
