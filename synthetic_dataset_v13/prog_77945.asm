; DESCRIPTION: Composite: Places a yellow dot at position (165, 186) then Renders a magenta box of size 65x27 starting at (22, 47).
; PLAN: r0=165(x), r1=186(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=22(x), r6=47(y), r7=65(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 186
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 22
LDI r6, 47
LDI r7, 65
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
