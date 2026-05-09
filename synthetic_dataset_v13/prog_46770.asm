; DESCRIPTION: Composite: Places a black dot at position (434, 186) then Renders a purple box of size 55x39 starting at (437, 149).
; PLAN: r0=434(x), r1=186(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=149(y), r7=55(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 186
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 437
LDI r6, 149
LDI r7, 55
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
