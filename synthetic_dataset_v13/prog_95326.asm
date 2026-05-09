; DESCRIPTION: Composite: Places a black 54x90 rectangle at position (328, 89) then Places a green dot at position (286, 154).
; PLAN: r0=328(x), r1=89(y), r2=54(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=154(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 328
LDI r1, 89
LDI r2, 54
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 154
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
