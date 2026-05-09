; DESCRIPTION: Composite: Creates a cyan rectangular region at (321, 61) spanning 86 by 42 pixels then Draws a white line from (130, 226) to (426, 98).
; PLAN: r0=321(x), r1=61(y), r2=86(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=226(y1), r7=426(x2), r8=98(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 61
LDI r2, 86
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 226
LDI r7, 426
LDI r8, 98
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
