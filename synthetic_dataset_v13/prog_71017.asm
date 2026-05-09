; DESCRIPTION: Composite: Places a cyan dot at position (417, 81) then Renders a white box of size 85x63 starting at (196, 33).
; PLAN: r0=417(x), r1=81(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=33(y), r7=85(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 81
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 33
LDI r7, 85
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
