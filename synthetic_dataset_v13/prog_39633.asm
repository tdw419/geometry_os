; DESCRIPTION: Composite: Places a magenta dot at position (162, 247) then Creates a cyan rectangular region at (25, 95) spanning 117 by 105 pixels.
; PLAN: r0=162(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=25(x), r6=95(y), r7=117(width), r8=105(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 25
LDI r6, 95
LDI r7, 117
LDI r8, 105
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
