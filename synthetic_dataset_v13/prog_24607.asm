; DESCRIPTION: Composite: Places a magenta dot at position (337, 201) then Renders a green box of size 40x94 starting at (327, 135).
; PLAN: r0=337(x), r1=201(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=135(y), r7=40(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 201
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 135
LDI r7, 40
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
