; DESCRIPTION: Composite: Creates a white rectangular region at (300, 120) spanning 54 by 105 pixels then Sets a single cyan pixel at (229, 213).
; PLAN: r0=300(x), r1=120(y), r2=54(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=213(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 300
LDI r1, 120
LDI r2, 54
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 213
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
