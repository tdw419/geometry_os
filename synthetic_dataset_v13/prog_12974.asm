; DESCRIPTION: Composite: Places a white 99x64 rectangle at position (216, 77) then Places a white dot at position (363, 154).
; PLAN: r0=216(x), r1=77(y), r2=99(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=154(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 216
LDI r1, 77
LDI r2, 99
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 154
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
