; DESCRIPTION: Composite: Creates a orange rectangular region at (363, 46) spanning 120 by 98 pixels then Places a cyan line segment connecting (294, 188) to (450, 106).
; PLAN: r0=363(x), r1=46(y), r2=120(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x1), r6=188(y1), r7=450(x2), r8=106(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 46
LDI r2, 120
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 188
LDI r7, 450
LDI r8, 106
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
