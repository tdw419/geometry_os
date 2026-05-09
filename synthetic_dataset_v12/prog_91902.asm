; DESCRIPTION: Composite: Creates a red rectangular region at (431, 5) spanning 35 by 91 pixels then Places a green dot at position (434, 202).
; PLAN: r0=431(x), r1=5(y), r2=35(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=202(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 431
LDI r1, 5
LDI r2, 35
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 202
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
