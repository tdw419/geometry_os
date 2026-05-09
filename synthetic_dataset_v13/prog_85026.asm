; DESCRIPTION: Composite: Places a purple dot at position (44, 75) then Renders a orange box of size 79x98 starting at (305, 146).
; PLAN: r0=44(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=146(y), r7=79(width), r8=98(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 75
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 146
LDI r7, 79
LDI r8, 98
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
