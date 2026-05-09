; DESCRIPTION: Composite: Places a red dot at position (290, 246) then Places a black 91x35 rectangle at position (42, 117).
; PLAN: r0=290(x), r1=246(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=117(y), r7=91(width), r8=35(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 246
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 42
LDI r6, 117
LDI r7, 91
LDI r8, 35
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
