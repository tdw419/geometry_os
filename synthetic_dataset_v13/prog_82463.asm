; DESCRIPTION: Composite: Places a magenta dot at position (139, 134) then Places a red 86x57 rectangle at position (91, 148).
; PLAN: r0=139(x), r1=134(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=148(y), r7=86(width), r8=57(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 134
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 91
LDI r6, 148
LDI r7, 86
LDI r8, 57
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
