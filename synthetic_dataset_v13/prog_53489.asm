; DESCRIPTION: Composite: Places a yellow dot at position (417, 120) then Places a red 81x27 rectangle at position (92, 223).
; PLAN: r0=417(x), r1=120(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=223(y), r7=81(width), r8=27(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 120
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 92
LDI r6, 223
LDI r7, 81
LDI r8, 27
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
