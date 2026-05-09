; DESCRIPTION: Composite: Places a yellow dot at position (65, 226) then Places a magenta 109x34 rectangle at position (187, 26).
; PLAN: r0=65(x), r1=226(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=26(y), r7=109(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 226
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 187
LDI r6, 26
LDI r7, 109
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
