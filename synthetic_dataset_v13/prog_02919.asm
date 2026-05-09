; DESCRIPTION: Composite: Places a green dot at position (91, 157) then Renders a cyan box of size 35x65 starting at (300, 98).
; PLAN: r0=91(x), r1=157(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=98(y), r7=35(width), r8=65(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 157
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 300
LDI r6, 98
LDI r7, 35
LDI r8, 65
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
